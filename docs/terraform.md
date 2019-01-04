## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin_iam_role_arn | IAM Role with admin permissions to map to `admin_k8s_username` | string | - | yes |
| admin_k8s_groups | List of Kubernetes groups to be mapped to `admin_iam_role_arn` | list | - | yes |
| admin_k8s_username | Kubernetes admin username to be mapped to `admin_iam_role_arn` | string | - | yes |
| readonly_iam_role_arn | IAM Role with readonly permissions to map to `readonly_k8s_username` | string | - | yes |
| readonly_k8s_groups | List of Kubernetes groups to be mapped to `readonly_iam_role_arn` | list | - | yes |
| readonly_k8s_username | Kubernetes readonly username to be mapped to `readonly_iam_role_arn` | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| kubeconfig_path | kubeconfig path |

