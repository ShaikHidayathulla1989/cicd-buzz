#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $${BRANCH}_${TRAVIS_TAG}-${COMMIT}-${TRAVIS_BUILD_NUMBER} .
docker push $${BRANCH}_${TRAVIS_TAG}-${COMMIT}-${TRAVIS_BUILD_NUMBER}
