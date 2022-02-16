docker run -d --restart=unless-stopped \
  -p 6080:80 -p 6443:443 \
  --privileged \
  --name rancher \
  rancher/rancher:v2.6.3-patch1
