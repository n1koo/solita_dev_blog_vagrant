#!/bin/sh

git clone https://github.com/solita/solita.github.com
bundle exec install
jekyll serve --watch