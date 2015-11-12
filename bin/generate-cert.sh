#!/bin/bash
cat << EOF > /tmp/req.conf
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no
[req_distinguished_name]
C = US
ST = WA
L = Seattle
O = dcarney
OU = dcarney
CN = localhost
[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1       = example.com
EOF

openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout key.pem -out cert.pem -config /tmp/req.conf
openssl x509 -in cert.pem -noout -text
