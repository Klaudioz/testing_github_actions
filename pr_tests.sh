#!/bin/sh -l

# pr_tests.sh
# -----------------------------------
# Automation utility which is able to run certain test in a certain cloud
# getting labels for a PR in GitHub. If the PR doesn't have any of this
# particular labels, this function will never run.
# -----------------------------------
#
# HISTORY:
#
# * DATE - v1.0.0  - First Creation
#
# ##################################################

echo "Labels without processing: $1"
