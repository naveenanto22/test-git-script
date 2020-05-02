FROM alpine:3.10

RUN apk add --no-cache git

COPY "test.sh" /usr/bin/test.sh
COPY "input_parser.sh" /usr/bin/input_parser.sh

ENTRYPOINT ["/usr/bin/test.sh"]