#!/usr/bin/env bash

RAILS_ENV=development rails db:create
RAILS_ENV=development rails db:migrate
RAILS_ENV=development rails db:seed
RAILS_ENV=development bundle exec puma -p 3000 -C config/puma.rb -D
