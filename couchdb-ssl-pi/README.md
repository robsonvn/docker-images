# CouchDB 2 with SSL support for Raspberry Pi

This image includes a self-signed certificate, but you can use your own.

## Install
```bash
docker pull couchdb-ssl-pi
```

## Running
```bash
docker run -it -p 5984:5984 -p 6984:6984 -p 4369:4369 -p 9100:9100 --name couchdb  -d \
--mount source=couchdb-volume,target=/opt/couchdb/data \
robsonvn/couchdb-ssl-pi
```

## Use your own certificate

The default config is waiting for server.key server.csr server.crt files, you can change it by using your own config file.

```bash
docker run -it -p 5984:5984 -p 6984:6984 -p 4369:4369 -p 9100:9100 --name couchdb  -d \
--mount source=couchdb-volume,target=/opt/couchdb/data \
-v /path/to/your/cert/folder:/opt/couchdb/cert
robsonvn/couchdb-ssl-pi
```

## Use your own config

```bash
docker run -it -p 5984:5984 -p 6984:6984 -p 4369:4369 -p 9100:9100 --name couchdb  -d \
--mount source=couchdb-volume,target=/opt/couchdb/data \
-v /path/to/your/local.ini:/opt/couchdb/etc/local.d/local.ini
robsonvn/couchdb-ssl-pi
```
