#!/usr/bin/env bash

RAILS_ENV=development rake searchkick:reindex CLASS=User
RAILS_ENV=development bundle exec puma -p 3001 -C config/puma.rb
