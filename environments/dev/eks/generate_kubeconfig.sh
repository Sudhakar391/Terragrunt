#!/bin/bash

# Read values from YAML file
CLUSTER_NAME=$(grep 'cluster_name' cluster_details.yaml | awk '{print $2}')
REGION=$(grep 'region' cluster_details.yaml | awk '{print $2}')

# Retrieve the cluster endpoint and CA certificate
CLUSTER_ENDPOINT=$(aws eks describe-cluster --name $CLUSTER_NAME --region $REGION --query "cluster.endpoint" --output text)
CLUSTER_CA=$(aws eks describe-cluster --name $CLUSTER_NAME --region $REGION --query "cluster.certificateAuthority.data" --output text)

# Export values as environment variables
export EKS_CLUSTER_ENDPOINT=$CLUSTER_ENDPOINT
export BASE64_ENCODED_CA_CERT=$CLUSTER_CA
export AWS_REGION=$REGION
export CLUSTER_NAME=$CLUSTER_NAME

# Generate kubeconfig from template
envsubst < kubeconfig.tpl > kubeconfig.yaml

echo "Kubeconfig file generated successfully: kubeconfig.yaml"
