FROM ubuntu:16.04

MAINTAINER Robson Nascimento robsonvnasc@gmail.com
ARG version=2.1.1
ENV COUCHDB_VERSION=$version

RUN adduser --system --no-create-home --shell /bin/bash --group --gecos "CouchDB Administrator" couchdb

RUN apt-get update -y && apt-get install -y --no-install-recommends \
  build-essential \
  pkg-config \
  erlang \
  libicu-dev \
  libmozjs185-dev \
  libcurl4-openssl-dev \
  git \
  tar \
  wget \
  curl

RUN cd /usr/src && wget http://www-us.apache.org/dist/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz && tar zxvf apache-couchdb-$COUCHDB_VERSION.tar.gz

RUN cd /usr/src/apache-couchdb-$COUCHDB_VERSION && ./configure --disable-docs && make release

RUN cp -R /usr/src/apache-couchdb-$COUCHDB_VERSION/rel/couchdb /opt/ \
&& apt-get purge -y --auto-remove \
&& rm -rf /usr/src/apache-couchdb-$COUCHDB_VERSION* \
&& mkdir /opt/couchdb/data \
&& chown -R couchdb:couchdb /opt/couchdb

COPY local.ini /opt/couchdb/etc/local.d/

RUN chown -R couchdb:couchdb /opt/couchdb/etc/local.d/

WORKDIR /opt/couchdb

EXPOSE 5984 6984 4369 9100

VOLUME ["/opt/couchdb/data"]

ENTRYPOINT ["/bin/bash"]
CMD ["/opt/couchdb/bin/couchdb"]
