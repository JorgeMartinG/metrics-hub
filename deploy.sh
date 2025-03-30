#!/bin/bash
docker network create "metrics-net"
docker run --name "cadvisor" --volume "/:/rootfs:ro" --volume "/var/run:/var/run:ro" --volume "/sys:/sys:ro" --network "metrics-net" --publish 8080:8080 --detach gcr.io/cadvisor/cadvisor:latest
docker run --name prometheus --volume "${PWD}/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml" --network "metrics-net" --publish 9090:9090 --detach prom/prometheus
