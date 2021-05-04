#!/usr/bin/env bash

RAILS_ENV=development rails db:create
RAILS_ENV=development rails db:migrate
RAILS_ENV=development rails db:seed
RAILS_ENV=development exec bundle exec rails s -p 3000 -b 0.0.0.0
