FROM alpine

RUN apk add --no-cache \
    git \
    bash \
    curl \
    protobuf

COPY *.sh /
ENTRYPOINT ["./test.sh"]