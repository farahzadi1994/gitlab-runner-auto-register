#!/bin/bash
set -e

echo "Fetching Runner Authentication Token..."
export RUNNER_AUTH_TOKEN=$(curl --silent --request POST \
  --header "PRIVATE-TOKEN: MyGeneratedToken123" \
  --data "runner_type=instance_type" \
  "${GITLAB_URL}/api/v4/user/runners" | jq -r '.token')

echo "Runner Authentication Token received: $RUNNER_AUTH_TOKEN"

