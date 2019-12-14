#!/bin/sh
docker login -u "${DOCKER_USER}" -p "${DOCKER_PASS}" "${DOCKER_REGISTRY}"
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
echo "Docker Username $DOCKER_USER"
echo "Docker Pass $DOCKER_PASS"
echo "Docker Registry $DOCKER_REGISTRY"

docker build -f Dockerfile -t "${TRAVIS_BRANCH}"_"${TRAVIS_BUILD_NUMBER}":"$TAG" .

docker tag "${TRAVIS_BRANCH}"_"${TRAVIS_BUILD_NUMBER}":"$TAG" "${DOCKER_USER}"/"${TRAVIS_BRANCH}"_"${TRAVIS_BUILD_NUMBER}":"$TAG"
 
docker push "${DOCKER_USER}"/"${TRAVIS_BRANCH}"_"${TRAVIS_BUILD_NUMBER}":"$TAG"
