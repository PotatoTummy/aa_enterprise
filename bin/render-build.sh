#!/usr/bin/env bash
# exit on error
set -o errexit

# Install MySQL client
apt-get update
apt-get install -y mysql-client

# Build commands
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Database setup commands
bundle exec rails db:environment:set RAILS_ENV=production

# Try to create database if it doesn't exist, then migrate
bundle exec rails db:create || true
bundle exec rails db:migrate
bundle exec rails db:seed

# Clear and rebuild cache
bundle exec rails tmp:clear
bundle exec rails log:clear
bundle exec rails cache:clear