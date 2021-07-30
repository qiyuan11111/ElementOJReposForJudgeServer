FROM ubuntu:18.04
MAINTAINER qiyuan
COPY tomcat/apache-tomcat-8.5.69.tar.gz /usr/local/apache-tomcat-8.5.69.tar.gz
COPY tomcat/start.sh /usr/local/elementoj/start.sh
RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list \
	&& apt-get update --fix-missing && apt-get install -y libseccomp-dev openjdk-8-jdk gcc g++ --fix-missing \
	&& cd /usr/local && tar -zxvf /usr/local/apache-tomcat-8.5.69.tar.gz && chmod 777 /usr/local/elementoj/start.sh \
	&& useradd -u 12001 compiler && useradd -u 12002 code && useradd -u 12003 spj && usermod -a -G code spj \
	&& chmod 755 -R /usr/local/apache-tomcat-8.5.69
EXPOSE 8080
CMD ["/bin/sh", "/usr/local/elementoj/start.sh"]