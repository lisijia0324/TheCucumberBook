#!/bin/bash

HAS_BUNDLER=`gem list --local | grep bundler`
if [ "$HAS_BUNDLER" = "" ]; then
  gem install bundler --no-rdoc --no-ri
fi

bundle check > /dev/null || bundle install

rm -rf out && mkdir out

bundle exec cucumber features