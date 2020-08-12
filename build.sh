#!/bin/bash

ARCH=$(uname -m)

git clone https://github.com/travis-ci/travis-build.git

cd ./travis-build

git checkout -t origin/enterprise-2.2

docker build -t quay.io/rpsene/travis:build-$ARCH .

docker login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN

docker images

#docker push quay.io/rpsene/travis:build-$ARCH
