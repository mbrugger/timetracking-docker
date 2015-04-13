#!/bin/bash

echo "rake db:create db:migrate"
sudo -u app -E bash -c 'bundle exec rake db:create db:migrate'
#echo "rake assets:precompile"
#sudo -u app -E bash -c 'bundle exec rake assets:precompile'
