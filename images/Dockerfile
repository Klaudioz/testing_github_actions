FROM alpine:3.7
COPY pr_tests.sh /pr_tests.sh
RUN apk add --no-cache curl jq

ENTRYPOINT ["/pr_tests.sh"]
