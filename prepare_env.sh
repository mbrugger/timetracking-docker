#!/bin/bash

echo "rake db:create db:migrate"
sudo -u app -E bash -c 'bundle exec rake db:create db:migrate'
