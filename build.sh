#!/bin/bash

if [ ! -d tools ]; then
    mkdir tools
fi

if [ ! -d tools/aws ]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
else
    echo "aws installation dir already present"
fi

if [ ! -f tools/go1.19.linux-amd64.tar.gz ]; then
    curl -L "https://go.dev/dl/go1.19.linux-amd64.tar.gz" -o "tools/go1.19.linux-amd64.tar.gz"
else
    echo "go installer already present"
fi

docker build -t mydevenv .
