FROM ubuntu:18.04

USER root

COPY ../pr_tests.sh /pr_tests.sh

RUN apt-get update && apt-get install -y jq

ENTRYPOINT ["/pr_tests.sh"]
