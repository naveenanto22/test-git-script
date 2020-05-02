FROM alpine:3.10

RUN apk add --no-cache git

COPY "test.sh" /usr/bin/runner
COPY "input_parser.sh" /usr/bin/input_parser.sh

CMD ["sh", "/usr/bin/runner"]