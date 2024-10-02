#!/bin/bash

# Build the base container first, and push it
docker buildx build --no-cache --platform arm64 -t chriswier/mikrotik-ubuntu:latest . --push --output type=docker
