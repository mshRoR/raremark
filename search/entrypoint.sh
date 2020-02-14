#!/usr/bin/env bash

RAILS_ENV=development rake db:migrate
# RAILS_ENV=development bundle exec puma -p 3000 -c config/unicorn_prod.rb -D
RAILS_ENV=development bundle exec puma -p 3001 -C config/puma.rb
