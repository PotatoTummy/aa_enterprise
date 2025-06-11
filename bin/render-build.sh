#!/usr/bin/env bash
# exit on error
set -o errexit

# Install MySQL client
curl -LO https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
dpkg -i mysql-apt-config_0.8.24-1_all.deb
apt-get update
apt-get install -y mysql-client

bundle install --deployment
bin/rails assets:precompile
bin/rails assets:clean