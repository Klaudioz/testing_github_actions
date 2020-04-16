FROM ubuntu:18.04

USER root

COPY pr_tests.sh /pr_tests.sh

ENTRYPOINT ["/pr_tests.sh"]
