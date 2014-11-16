# Pull base image.
FROM dockerfile/java:oracle-java7

MAINTAINER Robert Bjarnason <robert@citizens.is>

RUN echo 'version 0.4'

ENV ES_IP 127.0.0.1

# Install Logstash 1.4.2
RUN cd /tmp && \
    wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar xvzf logstash-1.4.2.tar.gz && \
    mv /tmp/logstash-1.4.2 /logstash && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.utf8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -qq update
RUN apt-get -yqq upgrade
RUN apt-get -yqq install supervisor

ADD locale /etc/default/locale
ADD supervisord.conf /etc/supervisor/supervisord.conf

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

# Add scripts
ADD scripts /scripts
RUN chmod +x /scripts/*.sh
ADD supervisor.conf /etc/supervisor/conf.d/logstash.conf

# Command to run
CMD ["/usr/bin/supervisord"]

# Expose listen ports
EXPOSE 1572
