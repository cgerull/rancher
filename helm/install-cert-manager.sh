helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set=installCRDs=”true” \
  --version v1.7.1
