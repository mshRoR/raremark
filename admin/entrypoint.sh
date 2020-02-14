#!/usr/bin/env bash
# Start the server
# RAILS_ENV=production bundle exec rails server --port 3000  --binding 0.0.0.0

RAILS_ENV=development rake db:migrate
# RAILS_ENV=development bundle exec puma -p 3000 -c config/unicorn_prod.rb -D
RAILS_ENV=development bundle exec puma -p 3000 -C config/puma.rb
