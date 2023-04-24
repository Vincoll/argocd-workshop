apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: app-demo-full-sync
  namespace: demo-sync
spec:
  destination:
    server: 'https://kubernetes.default.svc'
    namespace: demo-fs
  project: default
  source:
  # https://argo-cd.readthedocs.io/en/stable/user-guide/multiple_sources/
  # Source 1
   - repoURL: git@github.com:vincoll/argocd-workshop
     path: k8s-manifests/raw
     targetRevision: dev
  # Source 2
   - repoURL: git@github.com:vincoll/argocd-workshop
     path: k8s-manifests/extra
     targetRevision: dev
  syncPolicy:
    automated: # Activated
      prune: true
      selfHeal: false # FALSE
