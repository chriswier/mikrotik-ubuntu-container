#!/bin/bash

# Build the base container first, and push it
docker buildx build --no-cache --platform arm64 -t mikrotik-ubuntu .
docker save mikrotik-ubuntu > output/mikrotik-ubuntu_arm64.tar
