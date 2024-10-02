# mikrotik-ubuntu-container

Basic process:
1. ./setup-docker-multiarch.sh -- run once to get the multi-arch buildkit installed
2. ./build.sh -- uses Dockerfile to create the container and export it to a tar file (output directory)
   The tar file can be copied to your Mikrotik router directly
3. ./push-dockerhub.sh -- pushes to Dockerhub. Requires a .docker-config/config.json file with login credentials

