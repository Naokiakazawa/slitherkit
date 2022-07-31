#!/bin/sh

# Solidity version: 0.8.0 - 0.8.15
# Slither version: v0.8.3

echo "start building"

for ver in {0..15}
do
    version="0.8.$ver"
    echo "===> Build a docker image of $version"
    docker build -t slitherkit --build-arg SOLC=$version .

    echo "===> Push a docker image of $version"
    docker tag $(docker images slitherkit -q) naokiakazawa/slitherkit:$version
    docker images | grep slitherkit
    docker push naokiakazawa/slitherkit:$version

    echo "===> Clean up a docker image of $version"
    docker image rm -f $(docker images slitherkit -q)
done

docker builder prune -f -a
echo "Finish!"