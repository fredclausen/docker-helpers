#!/usr/bin/env sh
#shellcheck shell=sh

docker context create arm64 --docker "host=ssh://192.168.31.28"
docker context create arm32 --docker "host=ssh://192.168.31.27"
docker buildx create --use --name cluster default --platform linux/amd64
docker buildx create --append --name cluster arm32 --platform linux/arm/v7
docker buildx create --append --name cluster arm64 --platform linux/arm64
docker login