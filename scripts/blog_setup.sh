#!/bin/sh

#git clone https://github.com/solita/solita.github.com
cd solita.github.com
gem install bundler
bundle install
jekyll serve --watch