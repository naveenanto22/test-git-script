FROM alpine

# System setup
RUN apk update && apk add git curl build-base autoconf automake libtool

RUN apk add --no-cache \
    git \
    bash \
    curl \
    protobuf

COPY "test.sh" test.sh
COPY "input_parser.sh" input_parser.sh

WORKDIR /app
RUN git init
COPY /schema.proto ./schema.proto

WORKDIR /a
ENTRYPOINT ["./test.sh"]