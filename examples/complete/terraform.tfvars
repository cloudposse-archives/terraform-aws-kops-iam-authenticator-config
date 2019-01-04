admin_iam_role_arn = "arn:aws:iam::000000000000:role/KubernetesAdmin"

admin_k8s_username = "kubernetes-admin"

admin_k8s_groups = ["system:masters"]

readonly_iam_role_arn = "arn:aws:iam::000000000000:role/KubernetesReadonly"

readonly_k8s_username = "kubernetes-readonly"

readonly_k8s_groups = ["system:authenticated"]
