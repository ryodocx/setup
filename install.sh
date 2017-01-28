#!/bin/bash

# url
GO_URL=https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz
DOCKER_COMPOSE_URL=https://github.com/docker/compose/releases/download/1.10.0/docker-compose-Linux-x86_64
DCOS_URL=https://downloads.dcos.io/binaries/cli/linux/x86-64/dcos-1.8/dcos

# init
WKDIR=`pwd`
rm -rf tool
mkdir -p tool/bin
echo "export PATH=`pwd`/tool/bin:\$PATH" > setpath.sh

# Go
mkdir -p tool/go
curl -L $GO_URL -o go
tar -C tool/go -xzf go --strip-components 1
rm go
echo "export PATH=`pwd`/tool/go/bin:\$PATH" >> setpath.sh
echo "export PATH=`pwd`/tool/gopath/bin:\$PATH" >> setpath.sh
echo "export GOPATH=`pwd`/tool/gopath" >> setpath.sh

# Go tools
source setpath.sh
go get github.com/constabulary/gb/...
go get github.com/tebeka/go2xunit

# docker-compose
curl -L $DOCKER_COMPOSE_URL -o tool/bin/docker-compose

# dc/os cli
curl $DCOS_URL -o tool/bin/dcos