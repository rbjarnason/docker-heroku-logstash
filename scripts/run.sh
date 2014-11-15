#!/bin/bash

# Start Logstash
echo "Starting Logstash..."
sed -i 's|127.0.0.1|'$ES_IP'|g' /scripts/logstash.conf
/logstash/bin/logstash agent --config /scripts/logstash.conf
