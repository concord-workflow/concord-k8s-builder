#!/bin/sh

target=target
mkdir $target

cat > $target/openssl-with-ca.cnf <<-EOF
[ req ]
#default_bits		= 2048
#default_md		= sha256
#default_keyfile 	= privkey.pem
distinguished_name	= req_distinguished_name
attributes		= req_attributes

[ req_distinguished_name ]
countryName			= Country Name (2 letter code)
countryName_min			= 2
countryName_max			= 2
stateOrProvinceName		= State or Province Name (full name)
localityName			= Locality Name (eg, city)
0.organizationName		= Organization Name (eg, company)
organizationalUnitName		= Organizational Unit Name (eg, section)
commonName			= Common Name (eg, fully qualified host name)
commonName_max			= 64
emailAddress			= Email Address
emailAddress_max		= 64

[ req_attributes ]
challengePassword		= A challenge password
challengePassword_min		= 4
challengePassword_max		= 20

[v3_ca]
basicConstraints = critical,CA:TRUE
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always, issuer:always
EOF

openssl genrsa -out $target/ca.key 2048

openssl req \
  -x509 \
  -new \
  -nodes \
  -key $target/ca.key \
  -sha256 \
  -subj "/CN=fetesting.com" \
  -days 365 -out $target/ca.crt \
  -extensions v3_ca \
  -config $target/openssl-with-ca.cnf

# Uncomment this is not using kubeseal
#kubectl create secret tls ca-key-pair --key=$target/ca.key --cert=$target/ca.crt

kubectl create secret tls ca-key-pair --key=$target/ca.key --cert=$target/ca.crt --dry-run -o yaml > ca-key-pair.yml

cat ca-key-pair.yml | kubeseal \
 --controller-name=sealed-secrets \
 --controller-namespace=kube-system \
 --format yaml > ca-key-pair-sealed.yml

 kubectl apply -f ca-key-pair-sealed.yml
