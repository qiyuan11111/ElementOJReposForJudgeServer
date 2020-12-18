FROM ubuntu:18.04
MAINTAINER qiyuan
RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list;
COPY tomcat/apache-tomcat-8.5.60/ /usr/local/apache-tomcat-8.5.60/
RUN apt-get update --fix-missing && apt-get install -y libseccomp-dev openjdk-8-jdk --fix-missing \
	&& cd /usr/local 
COPY tomcat/OnlineJudge.war /usr/local/apache-tomcat-8.5.60/webapps/OnlineJudge.war
COPY config/apache2.conf /etc/apache2/apache2.conf
COPY config/start.sh /etc/apache2/start.sh
RUN	chmod 777 /etc/apache2/start.sh && mkdir /usr/local/apache-tomcat-8.5.60/logs \
	&& chmod 755 -R /usr/local/apache-tomcat-8.5.60
EXPOSE 8080
EXPOSE 80
CMD ["/bin/sh", "/etc/apache2/start.sh"]
