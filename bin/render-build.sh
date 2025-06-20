#!/usr/bin/env bash
set -o errexit

# Install PostgreSQL Client
apt-get update && apt-get install -y postgresql-client

# Install dependencies
bundle install

# Compile assets
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Set Rails environment
bundle exec rails db:environment:set RAILS_ENV=production

# Clear caches
bundle exec rails tmp:clear
bundle exec rails log:clear
bundle exec rails cache:clear
