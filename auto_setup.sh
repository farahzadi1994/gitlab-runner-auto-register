#!/bin/bash
set -e

echo "🚀 Starting GitLab and GitLab Runner..."
docker compose up -d

echo "⏳ Waiting for GitLab to be ready..."
until curl -s http://localhost:8080/users/sign_in > /dev/null; do
  echo "⌛ GitLab is not ready yet. Waiting 10 seconds..."
  sleep 10
done
echo "✅ GitLab is ready."

echo "🔑 Creating Personal Access Token (PAT)..."
docker exec -i gitlab gitlab-rails runner "
token = User.find_by_username('root').personal_access_tokens.create(
  scopes: ['create_runner'],
  name: 'AutoSetupPAT',
  expires_at: 1.days.from_now
);
token.set_token('SuperSecretPATToken123');
token.save!
"
echo "✅ PAT created."

echo "🔍 Fetching Runner Authentication Token..."
RUNNER_AUTH_TOKEN=$(curl --silent --request POST \
  --header "PRIVATE-TOKEN: SuperSecretPATToken123" \
  --data "runner_type=instance_type" \
  "http://localhost:8080/api/v4/user/runners" | jq -r '.token')

echo "🛠 Registering GitLab Runner..."
docker exec -i gitlab-runner gitlab-runner register --non-interactive \
  --url "http://gitlab:80" \
  --token "$RUNNER_AUTH_TOKEN" \
  --executor "docker" \
  --docker-image "docker:latest" \
  --description "Auto-Registered-Runner"

echo "🎯 Runner registered successfully."

echo "🩺 Checking Runner Health..."
bash scripts/monitor_runner.sh

echo "🎉 Setup Complete. GitLab and Runner are fully operational."
