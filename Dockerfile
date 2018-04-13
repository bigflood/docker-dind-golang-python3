FROM golang:1.10.1-alpine

FROM docker:dind

COPY --from=0 /usr/local/go /usr/local/go
RUN mkdir -p /go/src
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN apk add --no-cache py-pip
RUN pip install docker-compose

RUN apk add --no-cache python3 py3-pip

RUN apk add --no-cache gcc g++ musl-dev

RUN apk add --no-cache python3-dev

RUN pip3 install grpcio
