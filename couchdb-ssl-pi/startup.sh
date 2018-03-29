#!/bin/bash
mkdir -p /opt/couchdb/cert
openssl genrsa -out /opt/couchdb/cert/server.key 2048
openssl req -new -key /opt/couchdb/cert/server.key -out /opt/couchdb/cert/server.csr -subj "/C=NZ/ST=Auckland/L=Auckland/O=OrgName/OU=IT Department/CN=example.com"
openssl x509 -req -sha256 -days 1825 -in /opt/couchdb/cert/server.csr -signkey /opt/couchdb/cert/server.key -out /opt/couchdb/cert/server.crt

/opt/couchdb/bin/couchdb

