FROM roninkenji/slackware-base
MAINTAINER roninkenji

RUN slackpkg -batch=on -default_answer=y install httpd-2.4 apr-util sqlite cyrus-sasl apr openssl-solib
COPY httpd-conf.tgz /tmp/
COPY www.tgz /tmp/
COPY rc.httpd /etc/rc.d/
RUN mkdir /etc/httpd/conf.d
RUN chmod +x /etc/rc.d/rc.httpd
EXPOSE 80 443
VOLUME ["/var/www","/etc/httpd/conf.d","/var/log/httpd"]
ENTRYPOINT ["/etc/rc.d/rc.httpd"]

