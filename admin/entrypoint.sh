#!/usr/bin/env bash

RAILS_ENV=development rails db:setup
RAILS_ENV=development bundle exec puma -p 3000 -C config/puma.rb
