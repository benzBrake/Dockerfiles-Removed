#!/usr/bin/env bash
# Load build args
if [[ -f ${BUILD_DIRECTORY}/${BUILD_ARGS_FILE-build_args} ]]; then
    BUILD_ARGS=$(cat ${BUILD_DIRECTORY}/${BUILD_ARGS_FILE-build_args} | sed "s#^#--build-arg #")
fi
# Build image
docker build -t ${DOCKER_REPO}:${DOCKER_TAG-latest} ${BUILD_ARGS} ${BUILD_DIRECTORY}
# Tag image
if [[ ${TAG_LATEST} = "true" ]] && [[ ${DOCKER_TAG-latest} != "latest" ]] ; then
    docker tag ${DOCKER_REPO}:${DOCKER_TAG-latest} ${DOCKER_REPO}:latest
fi
# List image
docker images