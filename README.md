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
kubectl create ns cattle-system
. helm/install-rancher-2.6.sh
```

## Postinstall
Add an entry to `/etc/hosts` `sudo echo "127.0.0.1   rancher.local rancher" >> /etc/hosts`
Do a port forward `kubectl port-forward -n cattle-system svc/rancher 4443:443`
Go to `https://rancher:4443` and set trust on self-signed certificate in your browser.
Run `kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{"\n"}}'` to get the boot password.
