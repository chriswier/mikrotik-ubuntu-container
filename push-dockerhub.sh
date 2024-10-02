#!/usr/bin/bash

# tag the image
docker tag mikrotik-ubuntu:latest chriswier/mikrotik-ubuntu:latest

# push the image
docker --config .docker-config push chriswier/mikrotik-ubuntu:latest
