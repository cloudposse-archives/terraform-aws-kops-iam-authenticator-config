# Export kubeconfig from the kops store and get the kubeconfig path
data "external" "kube_config_path" {
  program = ["kops export kubecfg > /dev/null && echo -e {\"kube_config_path\": \"$KUBECONFIG\"}"]
}

# Get the cluster ID
data "external" "cluster_id" {
  program = ["kops export kubecfg > /dev/null && export CURRENT_CONTEXT=$(kubectl config current-context) && echo -e {\"cluster_id\": \"$CURRENT_CONTEXT\"}"]
}

data "template_file" "config" {
  template = "${file("${path.module}/config.tpl")}"

  vars {
    cluster_id            = "${data.external.cluster_id.result.cluster_id}"
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
provider "kubernetes" {
  config_path      = "${data.external.kube_config_path.result.kube_config_path}"
  load_config_file = true
}

# https://github.com/kubernetes/kops/blob/master/docs/authentication.md
# https://github.com/kubernetes-sigs/aws-iam-authenticator
resource "kubernetes_config_map" "aws_iam_authenticator" {
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
