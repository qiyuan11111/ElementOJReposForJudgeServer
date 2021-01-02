#!/bin/sh
rm -rf /judger/*
chmod 711 /judger

mkdir -p /judger/run
chown compiler:code /judger/run
chmod 711 /judger/run

mkdir -p /judger/spj
chown compiler:spj /judger/spj
chmod 710 /judger/spj

mkdir -p /test_case/special
chown compiler:code /test_case/special
chmod 711 /test_case/special

/usr/local/apache-tomcat-8.5.60/bin/catalina.sh run
/bin/bash