# ArgoCD Workshop

_Requirement : Local empty K8s Cluster_

## Create ArgoCD

```shell
# Add Argo Helm repo
helm repo add argo https://argoproj.github.io/argo-helm && helm repo update
helm search repo argocd
```

```shell
# Install ArgoCD in a argocd namespace
kubectl create ns argocd && \
helm install argocd argo/argo-cd --version 5.31.0 --namespace argocd --set "configs.params.server\\.insecure=true";
```


## Connect to Argo

```shell
# Get Argo Admin Secret
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
# Port Forward
kubectl -n argocd port-forward svc/argocd-server 8080:80
```

## Argo Settings

<http://localhost:8080/settings>

We will talk about :

* Admin Part
  * How to access a private git repo ?
  * How to add another K8s Cluster to this ArgoCD Instance
  * Few word about ArgoCD Project
* Run the Demo !

### Apply App of Apps

```shell
# Apply the AoA to populate Argo Apps.
kubectl apply -f argo-apps-of-app/appofapps.yaml

```
