#!/bin/bash

if [ ! -d aws ]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
else
    echo "aws installation dir already present"
fi

docker build -t mydevenv .
