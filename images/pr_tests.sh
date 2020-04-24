#!/bin/bash

# pr_tests.sh
# -----------------------------------
# Automation utility which is able to run certain test in a certain cloud
# getting labels for a PR in GitHub. If the PR doesn't have any of this
# particular labels, this code won't execute anything.
# -----------------------------------
#
# ##################################################

# Cleaning the json. Removing spaces, slashs and newlines
labels_json=$(echo "${1}" | sed 's/\\//g' | tr -d '\n' |tr -d ' ')

# Variables
RESOURCE_ID="124159" # I will need to update this ID when the new shippable job is created

# Storing the name of the labels to an array using jq
for row in $(echo "${labels_json}" | jq -c '.[]'); do
    labels_str+=( $(echo "${row}" | jq -c '.name') )
done

if [[ "${labels_str[@]}" =~ "e2e_gcloud" ]] || [[ "${labels_str[@]}" =~ "e2e_aws" ]] || [[ "${labels_str[@]}" =~ "e2e_do" ]] || [[ "${labels_str[@]}" =~ "e2e_azure" ]] || [[ "${labels_str[@]}" =~ "e2e_eks" ]]; then
    CLOUD=$(printf '%s\n' ${labels_str[@]} | grep 'e2e' | head -1 | cut -d "_" -f2)
    if [ -n "$CLOUD" ]; then
        curl -sX POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: apiToken ${shippable_token}" -d '{"globalEnv": {"test_cloud": $CLOUD}}' "https://api.shippable.com/resources/${RESOURCE_ID}/triggerNewBuildRequest"
    fi
fi
