# GoBGP
# $ docker run -dit --rm donn/gobgp

FROM golang:1.6

MAINTAINER Donn Lee <docker@pluza.com>
ARG user=donn

USER root
WORKDIR /root

RUN apt-get update && apt-get install -y --no-install-recommends \
    net-tools \
 && rm -rf /var/lib/apt/lists/* \
 && go get github.com/osrg/gobgp/gobgp \
 && go get github.com/osrg/gobgp/gobgpd

# && rm -rf ${GOPATH}/pkg/* ${GOPATH}/src/*

