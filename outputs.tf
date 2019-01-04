output "kubeconfig_path" {
  description = "kubeconfig path"
  value       = "${data.external.kube_config_path.result.kube_config_path}"
}
