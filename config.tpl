clusterID: ${cluster_id}
server:
  mapRoles:
  - roleARN: ${admin_iam_role_arn}
    username: ${admin_k8s_username}
    groups: ${admin_k8s_groups}
  - roleARN: ${readonly_iam_role_arn}
    username: ${readonly_k8s_username}
    groups: ${readonly_k8s_groups}
