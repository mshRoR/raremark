#!/usr/bin/env bash

RAILS_ENV=development exec bundle exec rake searchkick:reindex CLASS=User
RAILS_ENV=development exec bundle exec rails s -p 3001 -b 0.0.0.0
