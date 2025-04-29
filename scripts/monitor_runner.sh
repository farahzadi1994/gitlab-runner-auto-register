#!/bin/bash
set -e

echo "🔍 Verifying runner registration in GitLab..."
sleep 20
RUNNERS=$(curl --silent --header "PRIVATE-TOKEN: SuperSecretPATToken123" \
  "http://localhost:8080/api/v4/runners/all")

if echo "$RUNNERS" | grep '"online":true' > /dev/null; then
  echo "✅ Runner is online and connected to GitLab."
else
  echo "❗ Warning: Runner is registered but not connected."
  echo "🔧 Please check runner logs: docker logs gitlab-runner"
fi
