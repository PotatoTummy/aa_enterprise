#!/usr/bin/env bash
# exit on error
set -o errexit

# Install MySQL client
apt-get update
apt-get install -y mysql-client

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:schema:load
bundle exec rails db:migrate