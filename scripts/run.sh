#!/bin/bash

# Start Logstash
echo "Starting Logstash..."
RUN sed -i 's|127.0.0.1|'$ELASTICSEARCH_IP'|g' /scripts/logstash.conf
/logstash/bin/logstash agent --config /scripts/logstash.conf
