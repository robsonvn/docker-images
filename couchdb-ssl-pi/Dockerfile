FROM raspbian/jessie

MAINTAINER Robson Nascimento robsonvnasc@gmail.com
ARG version=2.1.1
ENV COUCHDB_VERSION=$version

RUN adduser --system --no-create-home --shell /bin/bash --group --gecos "CouchDB Administrator" couchdb

RUN apt-get update -y && apt-get install -y --no-install-recommends \
  build-essential \
  pkg-config \
  libicu-dev \
  libmozjs185-dev \
  libcurl4-openssl-dev \
  git \
  tar \
  wget \
  erlang \
  curl

RUN cd /usr/src && wget http://www-us.apache.org/dist/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz && tar zxvf apache-couchdb-$COUCHDB_VERSION.tar.gz

RUN curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl && chmod a+x kerl

RUN apt-get -y install libssl-dev ncurses-dev 
RUN wget http://erlang.org/download/otp_src_18.2.tar.gz
RUN tar -xzvf otp_src_18.2.tar.gz
RUN cd /otp_src_18.2/ && ./configure
RUN cd /otp_src_18.2/ && make
RUN cd /otp_src_18.2/ && make install
RUN rm -R /otp_src_18.2/ && rm /otp_src_18.2.tar.gz

RUN cd /usr/src/apache-couchdb-$COUCHDB_VERSION && ./configure --disable-docs && make release

RUN cp -R /usr/src/apache-couchdb-$COUCHDB_VERSION/rel/couchdb /opt/ \
&& apt-get purge -y --auto-remove \
&& rm -rf /usr/src/apache-couchdb-$COUCHDB_VERSION* \
&& mkdir /opt/couchdb/data \
&& chown -R couchdb:couchdb /opt/couchdb

COPY local.ini /opt/couchdb/etc/local.d/
COPY startup.sh /opt/couchdb/startup.sh

RUN chown -R couchdb:couchdb /opt/couchdb/
RUN chmod +x /opt/couchdb/startup.sh

WORKDIR /opt/couchdb

EXPOSE 5984 6984 4369 9100

VOLUME ["/opt/couchdb/data"]

ENTRYPOINT ["/bin/bash"]
CMD ["/opt/couchdb/startup.sh"]

