FROM docker.elastic.co/logstash/logstash:5.6.2

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN yum update -y
RUN yum install -y git
RUN cd /opt && git clone https://github.com/HASecuritySolutions/docker_VulnWhisperer_Logstash.git
RUN cp /opt/docker_VulnWhisperer_Logstash/configs/* /usr/share/logstash/pipeline/
RUN useradd -ms /bin/bash logstash
USER logstash

STOPSIGNAL SIGTERM
