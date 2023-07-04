#!/bin/bash

target_tag=$(curl --silent "https://api.github.com/repos/AliyunContainerService/image-syncer/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

if [ "${1}" != "latest" ]; then
  target_tag=${1} 
fi

wget https://github.com/AliyunContainerService/image-syncer/releases/download/"${target_tag}"/image-syncer-"${target_tag}"-linux-amd64.tar.gz

tar -xvf image-syncer-"${target_tag}"-linux-amd64.tar.gz