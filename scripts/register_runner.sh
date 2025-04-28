#!/bin/bash
set -e

echo "Registering GitLab Runner..."
gitlab-runner register --non-interactive \
  --url "${GITLAB_URL}" \
  --token "${RUNNER_AUTH_TOKEN}" \
  --executor "docker" \
  --docker-image "docker:latest" \
  --description "${RUNNER_DESCRIPTION}" \
  --tag-list "${RUNNER_TAGS}" \
  --run-untagged="true" \
  --locked="false"

echo "Runner registered successfully!"

