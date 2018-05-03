#!/bin/bash
version=$1

docker build -t swibuild --build-arg version=${version} .
id=$(docker create swibuild)
docker cp $id:/app/env-${version}.tar.bz2 .
docker rm -v $id
