# https://kubernetes.github.io/ingress-nginx/deploy/#prerequisite-generic-deployment-command

# the helm charts are fairly outdated for nginx ingress ,prelifecyclehoosk are missing and
# Missing udp-service config maps and blocks 

# values has a sample definition which makes it work to some extent 
helm install stable/nginx-ingress --name nginx-ingress -f values.yaml

# Just parameterize what we need for now  and change the other things as necessary 
