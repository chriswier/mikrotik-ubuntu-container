#!/bin/bash

# Build the base container first, and export it to a tar
docker buildx build --platform arm64 -t chriswier/mikrotik-ubuntu:latest -o type=docker,dest=- . > output/mikrotik-ubuntu_arm64.tar
