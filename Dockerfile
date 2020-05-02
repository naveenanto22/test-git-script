FROM alpine:3.10

RUN apk add --no-cache \
    git \
    bash \
    curl \
    protobuf


COPY "test.sh" test.sh
COPY "input_parser.sh" input_parser.sh

ENTRYPOINT ["./test.sh"]