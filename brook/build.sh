#!/usr/bin/env bash
cd $(dirname $(readlink -f $0))
BROOK_VERSION=$(curl -s https://api.github.com/repos/txthinking/brook/releases/latest | grep "tag_name" | cut -d \" -f 4)
docker build -t ${DOCKER_USERNAME-benzbrake}/brook:${BROOK_VERSION} .
docker tag ${DOCKER_USERNAME-benzbrake}/brook:${BROOK_VERSION} ${DOCKER_USERNAME-benzbrake}/brook:latest
docker images
docker login -u ${DOCKER_USERNAME-benzbrake} -p ${DOCKER_PASSWORD}
docker push ${DOCKER_USERNAME-benzbrake}/brook:${BROOK_VERSION}
docker push ${DOCKER_USERNAME-benzbrake}/brook:latest