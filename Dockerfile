# Pull base image.
FROM yrpri/java-base

MAINTAINER Robert Bjarnason <robert@citizens.is>

RUN echo 'version 0.8'

ENV ES_HOST 127.0.0.1

# Install Logstash 1.4.2
RUN cd /tmp && \
    wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar xvzf logstash-1.4.2.tar.gz && \
    mv /tmp/logstash-1.4.2 /logstash && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add scripts
ADD scripts /scripts
RUN chmod +x /scripts/*.sh
ADD supervisor.conf /etc/supervisor/conf.d/logstash.conf

# Expose listen ports
EXPOSE 1572
