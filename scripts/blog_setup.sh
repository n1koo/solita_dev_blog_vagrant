#!/bin/sh
source $HOME/.rvm/scripts/rvm
cd solita.github.com
gem install bundler
bundle install
jekyll serve --watch