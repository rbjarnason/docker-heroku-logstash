# Pull base image.
FROM dockerfile/java:oracle-java7

MAINTAINER Robert Bjarnason <robert@citizens.is>

VERSION "0.1"

ENV ELASTICSEARCH_IP 127.0.0.1

# Install Logstash 1.4.2
RUN cd /tmp && \
    wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar xvzf logstash-1.4.2.tar.gz && \
    mv /tmp/logstash-1.4.2 /logstash && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add scripts
ADD scripts /scripts
RUN chmod +x /scripts/*.sh

# Command to run
ENTRYPOINT ["/scripts/run.sh"]
CMD [""]

# Expose listen ports
EXPOSE 1572
