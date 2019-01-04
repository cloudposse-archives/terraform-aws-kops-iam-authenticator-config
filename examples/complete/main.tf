module "iam_authenticator_config" {
  source                = "../../"
  admin_iam_role_arn    = "${var.admin_iam_role_arn}"
  admin_k8s_username    = "${var.admin_k8s_username}"
  admin_k8s_groups      = "${var.admin_k8s_groups}"
  readonly_iam_role_arn = "${var.readonly_iam_role_arn}"
  readonly_k8s_username = "${var.readonly_k8s_username}"
  readonly_k8s_groups   = "${var.readonly_k8s_groups}"
}
