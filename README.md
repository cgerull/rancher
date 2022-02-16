# Rancher

## Install on Linux

Build kubernetes manifests from helm file.
```bash
helm template rancher rancher-stable/rancher --version=2.6.3 --set letsEncrypt.email=claus.gerull@solvinity.com,letsEncrypt.environment=staging > kubernetes/rancher.yaml
```

Install 
```bash
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.crds.yaml
kubectl apply -f kubernetes/rancher.yaml
```

## Install on k3d cluster on MacOS

```bash
kubectl create ns cert-manager
kubectl apply -f cert-manager/cert-manager.yaml
# Wait  until all pods are running.

```
