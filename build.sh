#!/bin/bash

ARCH=$(uname -m)

git clone https://github.com/travis-ci/travis-build.git

cd ./travis-build

git checkout -t origin/enterprise-2.2

sed -i 's/FROM ruby:2.4.2 as builder/FROM ppc64le/ruby:2.4.2 as builder/' ./Dockerfile

sed -i 's/FROM ruby:2.4.2-slim/FROM ppc64le/ruby:2.4.2-slim/' ./Dockerfile

docker build -t quay.io/rpsene/travis:build .

docker login quay.io -u "$ROBOT_USER" -p $ROBOT_TOKEN

docker images

docker images | awk '{print $1}' | awk 'NR==2'

#docker push quay.io/rpsene/travis:build-$ARCH
