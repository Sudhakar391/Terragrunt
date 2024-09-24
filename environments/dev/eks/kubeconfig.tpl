apiVersion: v1
clusters:
- cluster:
    server: ${EKS_CLUSTER_ENDPOINT}
    certificate-authority-data: ${BASE64_ENCODED_CA_CERT}
  name: eks-cluster
contexts:
- context:
    cluster: eks-cluster
    user: aws
  name: eks-context
current-context: eks-context
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws
      args:
        - "eks"
        - "get-token"
        - "--region"
        - "${AWS_REGION}"
        - "--cluster-name"
        - "${CLUSTER_NAME}"
