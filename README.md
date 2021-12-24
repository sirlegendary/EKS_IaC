# EKS 

## Env Variables
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

## Configure 'kubectl' to interact with your EKS cluster.
```
aws eks --region us-east-1 update-kubeconfig --name eks-dev-cluster-eks-dev-cluster
```
```
# If terraform is ran via CLI
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

## Confirm the cluster is up and running.
```
kubectl get cs
```

## Connect worker nodes to control panel
```
kubectl create -f authconfig.yaml
```

## List active Nodes
```
kubectl get nodes
```

## Check deployments
```
kubectl get deployments
```