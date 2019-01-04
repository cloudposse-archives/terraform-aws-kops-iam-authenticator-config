variable "admin_iam_role_arn" {
  type        = "string"
  description = "IAM Role with admin permissions to map to `admin_k8s_username`"
}

variable "admin_k8s_username" {
  type        = "string"
  description = "Kubernetes admin username to be mapped to `admin_iam_role_arn`"
}

variable "admin_k8s_groups" {
  type        = "list"
  description = "List of Kubernetes groups to be mapped to `admin_iam_role_arn`"
}

variable "readonly_iam_role_arn" {
  type        = "string"
  description = "IAM Role with readonly permissions to map to `readonly_k8s_username`"
}

variable "readonly_k8s_username" {
  type        = "string"
  description = "Kubernetes readonly username to be mapped to `readonly_iam_role_arn`"
}

variable "readonly_k8s_groups" {
  type        = "list"
  description = "List of Kubernetes groups to be mapped to `readonly_iam_role_arn`"
}
