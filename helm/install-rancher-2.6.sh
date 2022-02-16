helm upgrade --install rancher rancher-stable/rancher \
  --version 2.6.3 \
  --namespace cattle-system \
  --create-namespace \
  --set hostname=rancher.local
