#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS $DOCKER_REGISTRY
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t "${TRAVIS_BRANCH}"_"${TRAVIS_BUILD_NUMBER}":"$TAG" .
docket tag "${TRAVIS_BRANCH}"_"${TRAVIS_BUILD_NUMBER}" "${DOCKER_USER}"/"${TRAVIS_BRANCH}"_"${TRAVIS_BUILD_NUMBER}":"$TAG" 
docker push ${DOCKER_USER}/"${TRAVIS_BRANCH}"_"${TRAVIS_BUILD_NUMBER}":"$TAG"
