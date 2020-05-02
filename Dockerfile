FROM alpine:3.10

# System setup
RUN apk update && apk add git curl build-base autoconf automake libtool

RUN apk add --no-cache \
    git \
    bash \
    curl \
    protobuf

# COPY "test.sh" test.sh
# COPY "input_parser.sh" input_parser.sh
COPY . .

ENTRYPOINT ["./test.sh"]