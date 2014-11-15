# Pull base image.
FROM dockerfile/java:oracle-java7

MAINTAINER Robert Bjarnason <robert@citizens.is>

RUN echo 'version 0.1'

ENV ES_IP 127.0.0.1

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

# Command to run
ENTRYPOINT ["/scripts/run.sh"]
CMD ["/usr/bin/supervisord"]

# Expose listen ports
EXPOSE 1572
