# GoBGP
# $ docker run -dit --rm donn/gobgp

FROM golang:1.6

MAINTAINER Donn Lee <docker@pluza.com>
ARG user=donn

USER root
WORKDIR /root

# Make this a separate layer so re-builds are faster.
RUN echo "Fetching gobgp..." \
 && go get github.com/osrg/gobgp/gobgp \
 && echo "Fetching gobgpd..." \
 && go get github.com/osrg/gobgp/gobgpd

# Install vim so you can paste-in a gobgpd.conf file.
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash-completion ifupdown net-tools tcpdump telnet vim \
 && rm -rf /var/lib/apt/lists/*

ADD gobgp-completion.bash /root/
ADD gobgp-dynamic-completion.bash /root/
ADD gobgp-static-completion.bash /root/

# && rm -rf ${GOPATH}/pkg/* ${GOPATH}/src/*

