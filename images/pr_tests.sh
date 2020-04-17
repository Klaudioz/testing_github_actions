#!/bin/bash

# pr_tests.sh
# -----------------------------------
# Automation utility which is able to run certain test in a certain cloud
# getting labels for a PR in GitHub. If the PR doesn't have any of this
# particular labels, this function will never run.
# -----------------------------------
#
# ##################################################

# Removing spaces, slashs and newlines
labels_json=$(echo "${1}" | sed 's/\\//g' | tr -d '\n' |tr -d ' ')

for row in $(echo "${labels_json}" | jq -c '.[]'); do
    _jq() {
     echo "${row}" | jq -c "${1}"
    }
   #echo "$(_jq '.name')"
   _jq '.name'
done

# For now it's only echoing the labels
