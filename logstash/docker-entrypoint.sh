#!/bin/bash

set -e

/opt/logstash/bin/plugin install logstash-input-beats
exec logstash -f /etc/logstash/conf.d/*
