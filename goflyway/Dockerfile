FROM docker.io/library/golang as build
ARG VERSION=master
RUN mkdir -pv /go/src/github.com/coyove \
    && cd /go/src/github.com/coyove \
    && git clone https://github.com/coyove/goflyway \
    && cd goflyway \
    && git checkout ${VERSION} \
    && go get -d -v ./... \
    && cd /go/bin \
    && CGO_ENABLED=0 go build /go/src/github.com/coyove/goflyway/cmd/goflyway/main.go
ENTRYPOINT ["bash"]

FROM scratch
MAINTAINER Ryan Lieu <github-benzBrake@woai.ru>
COPY --from=build /go/bin/main /goflyway
ADD https://github.com/coyove/goflyway/raw/v1.0/chinalist.txt /chinalist.txt
EXPOSE 8100
ENTRYPOINT ["/goflyway"]