FROM ubuntu:18.04
MAINTAINER qiyuan
RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list;
COPY tomcat/apache-tomcat-8.5.60/ /usr/local/apache-tomcat-8.5.60/
COPY tomcat/OnlineJudge.war /usr/local/apache-tomcat-8.5.60/webapps/OnlineJudge.war
COPY config/apache2.conf /etc/apache2/apache2.conf
COPY config/start.sh /etc/apache2/start.sh
RUN apt-get update --fix-missing && apt-get install -y libseccomp-dev openjdk-8-jdk --fix-missing \
	&& cd /usr/local && chmod 777 /etc/apache2/start.sh && mkdir /usr/local/apache-tomcat-8.5.60/logs \
	&& chmod 755 -R /usr/local/apache-tomcat-8.5.60 \
	&& useradd -u 12001 compiler && useradd -u 12002 code && useradd -u 12003 spj && usermod -a -G code spj
EXPOSE 8080
CMD ["/bin/sh", "/etc/apache2/start.sh"]
