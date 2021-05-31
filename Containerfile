FROM znc:latest

LABEL maintainer="Uco Mesdag <uco@mesd.ag>"
LABEL build_date="2022-10-24T14:21:00CEST"

ENV container=docker

RUN apk add --no-cache --virtual build-dependencies \
        curl \
    && mkdir /palaver-src && cd /palaver-src \
    && curl -fsSL "https://github.com/cocodelabs/znc-palaver/archive/master.tar.gz" -o palaver.tgz \
    && tar -zxf palaver.tgz --strip-components=1 \
    && PATH=$PATH:/opt/znc/bin/ make \
    && cp palaver.so /opt/znc/lib64/znc/ \
    && apk del build-dependencies \
    && cd / && rm -rf /palaver-src
