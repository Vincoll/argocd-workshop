# argocd-workshop
Argo CD Workshop demo

## Create ArgoCD

helm repo add argo https://argoproj.github.io/argo-helm && helm repo update

kubectl create ns argocd && \
helm install argocd argo/argo-cd --version 5.27.1 --namespace argocd --set "configs.params.server\\.insecure=true";

## Connect to Argo

```shell
# Get Argo Admin Secret
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
# Port Forward
kubectl -n argocd port-forward svc/argocd-server 8080:80
```

### Apply App of Apps

```shell
# Apply the AoA to populate Argo Apps.
kubectl apply -f argo-apps-of-app/appofapps.yaml

```
