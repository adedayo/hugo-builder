FROM alpine:latest

MAINTAINER TS <ts@ambiweb.de>

RUN apk add --no-cache \
    curl

ENV VERSION 0.47
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo \
    && rm -rf /usr/local/src/hugo_extended_${VERSION}_Linux-64bit.tar.gz

WORKDIR /src

EXPOSE 1313
