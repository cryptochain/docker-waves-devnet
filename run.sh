#!/bin/bash

docker run --name waves-devnet \
  -tid \
  -p 6863:6863 \
  -p 6869:6869 \
  -v /home/gitlab-runner/containers/docker-waves-devnet/conf:/conf \
  -v /home/gitlab-runner/containers/docker-waves-devnet/data:/data \
  cryptochain/docker-waves-devnet:latest waves.conf
