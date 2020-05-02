FROM alpine

RUN apk add --no-cache \
    git \
    bash \
    curl \
    protobuf \
    nodejs \
    nodejs-npm

RUN npm install -g quicktype

COPY *.sh /
COPY code_generator.sh /github/workspace
ENTRYPOINT ["./test.sh"]