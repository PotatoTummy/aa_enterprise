#!/usr/bin/env bash
# Exit on any error
set -o errexit

# Install PostgreSQL client if needed (optional on Render)
apt-get update && apt-get install -y postgresql-client

# Install dependencies
bundle install

# Compile assets
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Set environment (optional, just to be explicit)
bundle exec rails db:environment:set RAILS_ENV=production

# Setup the database (safe on redeploys)
bundle exec rails db:create || true
bundle exec rails db:migrate
bundle exec rails db:seed

# Clear caches and logs
bundle exec rails tmp:clear
bundle exec rails log:clear
bundle exec rails cache:clear
