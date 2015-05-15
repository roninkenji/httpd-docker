FROM roninkenji/slackware-base
MAINTAINER roninkenji

RUN slackpkg -batch=on -default_answer=y install httpd-2.4 apr-util sqlite cyrus-sasl apr openssl-solib
# COPY httpd-conf.tgz /tmp/
# COPY www.tgz /tmp/
# COPY rc.httpd /etc/rc.d/
COPY myinit.sh /tmp/
RUN chmod +x /tmp/myinit.sh
RUN mkdir -p /srv/config /srv/data
EXPOSE 80 443
VOLUME ["/srv/data", "/srv/config"]
ENTRYPOINT ["/tmp/myinit.sh"]

