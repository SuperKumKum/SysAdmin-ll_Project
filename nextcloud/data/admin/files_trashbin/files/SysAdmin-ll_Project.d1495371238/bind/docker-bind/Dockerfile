# based on docker img from sameersbn
# web-interace not installed 
# https://github.com/sameersbn/docker-bind

FROM superkumkum/ubuntu-16.04 
MAINTAINER c.gossiaux@students.ephec.be 

ENV	BIND_USER=bind \
	DATA_DIR=/data 

RUN	rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y bind9 bind9-host \ 
	&& rm -rf /var/lib/apt/lists/* 

COPY	entrypoint.sh /sbin/entrypoint.sh
RUN	chmod 755 /sbin/entrypoint.sh 

EXPOSE	53/udp 53/tcp 
VOLUME	["${DATA_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/sbin/named"]
