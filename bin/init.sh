#!/bin/sh

cp config/database.yml.sample config/database.yml

bundle install --without production
rake db:create:all
rake db:schema:load
rake db:migrate
git checkout db/schema.rb
