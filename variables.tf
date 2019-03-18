variable "enabled" {
  type        = "string"
  description = "Set to true to enable the module, otherwise it will not create any resources"
  default     = "false"
}

variable "cluster_id" {
  type        = "string"
  description = "A unique-per-cluster identifier to prevent replay attacks. Good choices are a random token or a domain name that will be unique to your cluster"
  default     = "random"
}

variable "kube_config_path" {
  type        = "string"
  description = "Path to the kube config file. Can be sourced from `KUBE_CONFIG` or `KUBECONFIG`"
  default     = ""
}

variable "admin_iam_role_arn" {
  type        = "string"
  description = "IAM Role with admin permissions to map to `admin_k8s_username`"
  default     = ""
}

variable "admin_k8s_username" {
  type        = "string"
  description = "Kubernetes admin username to be mapped to `admin_iam_role_arn`"
  default     = ""
}

variable "admin_k8s_groups" {
  type        = "list"
  description = "List of Kubernetes groups to be mapped to `admin_iam_role_arn`"
  default     = []
}

variable "readonly_iam_role_arn" {
  type        = "string"
  description = "IAM Role with readonly permissions to map to `readonly_k8s_username`"
  default     = ""
}

variable "readonly_k8s_username" {
  type        = "string"
  description = "Kubernetes readonly username to be mapped to `readonly_iam_role_arn`"
  default     = ""
}

variable "readonly_k8s_groups" {
  type        = "list"
  description = "List of Kubernetes groups to be mapped to `readonly_iam_role_arn`"
  default     = []
}
