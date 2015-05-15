#!/bin/bash
CONF=/srv/config
DATA=/srv/data

if [ ! -f ${CONF}/httpd.conf ]; then
  cp -rp /etc/httpd/* ${CONF}
  sed -i -e 's#/etc/httpd#'${CONF}'#' ${CONF}/httpd.conf ${CONF}/extra/*.conf
  sed -i -e 's#/srv/httpd#'${DATA}'#' ${CONF}/httpd.conf ${CONF}/extra/*.conf
fi

if [ ! -f ${DATA}/htdocs ]; then
  cp -rp /srv/httpd/* ${DATA}
fi

exec /usr/sbin/httpd -DNO_DETACH -f ${CONF}/httpd.conf
