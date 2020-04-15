FROM alpine:3.10
COPY build.sh /build.sh
ENTRYPOINT ["/build.sh"]
