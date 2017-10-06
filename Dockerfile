FROM docker.elastic.co/logstash/logstash:5.6.2

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

USER root
RUN yum update -y
RUN yum install -y wget
RUN cd /usr/share/logstash/pipeline/ && wget https://github.com/HASecuritySolutions/docker_VulnWhisperer_Logstash/raw/master/vulnwhisp.conf
RUN useradd -ms /bin/bash logstash
USER logstash

STOPSIGNAL SIGTERM
