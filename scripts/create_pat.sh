#!/bin/bash
set -e

echo "Creating Personal Access Token..."
docker exec -i gitlab gitlab-rails runner "
token = User.find_by_username('root').personal_access_tokens.create(
  scopes: ['create_runner'],
  name: '${PAT_NAME}',
  expires_at: 1.days.from_now
);
token.set_token('MyGeneratedToken123');
token.save!
"
echo "Personal Access Token created."

