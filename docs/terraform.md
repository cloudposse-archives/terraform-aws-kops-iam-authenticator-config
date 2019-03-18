## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin_iam_role_arn | IAM Role with admin permissions to map to `admin_k8s_username` | string | `` | no |
| admin_k8s_groups | List of Kubernetes groups to be mapped to `admin_iam_role_arn` | list | `<list>` | no |
| admin_k8s_username | Kubernetes admin username to be mapped to `admin_iam_role_arn` | string | `` | no |
| cluster_id | A unique-per-cluster identifier to prevent replay attacks. Good choices are a random token or a domain name that will be unique to your cluster | string | `random` | no |
| enabled | Set to true to enable the module, otherwise it will not create any resources | string | `false` | no |
| kube_config_path | Path to the kube config file. Can be sourced from `KUBE_CONFIG` or `KUBECONFIG` | string | `` | no |
| readonly_iam_role_arn | IAM Role with readonly permissions to map to `readonly_k8s_username` | string | `` | no |
| readonly_k8s_groups | List of Kubernetes groups to be mapped to `readonly_iam_role_arn` | list | `<list>` | no |
| readonly_k8s_username | Kubernetes readonly username to be mapped to `readonly_iam_role_arn` | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| kubeconfig_path | kubeconfig path |

