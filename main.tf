resource "random_pet" "cluster" {
  count  = "${var.enabled == "true" && var.cluster_id == "random" ? 1 : 0}"
  length = 4

  keepers = {
    admin_iam_role_arn    = "${var.admin_iam_role_arn}"
    readonly_iam_role_arn = "${var.readonly_iam_role_arn}"
  }
}

data "template_file" "config" {
  template = "${file("${path.module}/config.tpl")}"

  vars {
    cluster_id            = "${var.cluster_id == "random" ? join("", random_pet.cluster.*.id) : var.cluster_id}"
    admin_iam_role_arn    = "${var.admin_iam_role_arn}"
    admin_k8s_username    = "${var.admin_k8s_username}"
    admin_k8s_groups      = "${jsonencode(var.admin_k8s_groups)}"
    readonly_iam_role_arn = "${var.readonly_iam_role_arn}"
    readonly_k8s_username = "${var.readonly_k8s_username}"
    readonly_k8s_groups   = "${jsonencode(var.readonly_k8s_groups)}"
  }
}

# https://www.terraform.io/docs/providers/kubernetes/guides/getting-started.html
# https://www.terraform.io/docs/providers/kubernetes/index.html
# https://www.terraform.io/docs/configuration/providers.html#alias-multiple-provider-instances
provider "kubernetes" {
  alias = "aws_iam_authenticator"

  # Even when this module is disabled, if a previous, enabled version created
  # kubernetes_config_map.aws_iam_authenticator
  # you will need to provide a valid kube_config_path to enable terraform to query and delete that resource
  config_path = "${var.kube_config_path}"

  load_config_file = true
}

# https://github.com/kubernetes/kops/blob/master/docs/authentication.md
# https://github.com/kubernetes-sigs/aws-iam-authenticator
resource "kubernetes_config_map" "aws_iam_authenticator" {
  count    = "${var.enabled == "true" ? 1 : 0}"
  provider = "kubernetes.aws_iam_authenticator"

  metadata {
    name      = "aws-iam-authenticator"
    namespace = "kube-system"

    labels = {
      k8s-app = "aws-iam-authenticator"
    }
  }

  data {
    "config.yaml" = "${data.template_file.config.rendered}"
  }
}
