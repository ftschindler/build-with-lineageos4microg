#!/bin/bash

# see https://github.com/lineageos4microg/docker-lineage-cicd

export BASEDIR="$(cd "$(dirname ${BASH_SOURCE[0]})" ;  pwd -P )"
mkdir -p ${BASEDIR}/{lineage,zips,logs,cache,keys,manifests}

docker run \
    --rm \
    --name lineageos4microg \
    -e "BRANCH_NAME=lineage-20" \
    -e "DEVICE_LIST=FP3" \
    -e "SIGN_BUILDS=true" \
    -e "SIGNATURE_SPOOFING=restricted" \
    -e "WITH_GMS=true" \
    -v "${BASEDIR}/lineage:/srv/src" \
    -v "${BASEDIR}/zips:/srv/zips" \
    -v "${BASEDIR}/logs:/srv/logs" \
    -v "${BASEDIR}/cache:/srv/ccache" \
    -v "${BASEDIR}/keys:/srv/keys" \
    -v "${BASEDIR}/manifests:/srv/local_manifests" \
    lineageos4microg/docker-lineage-cicd:latest
