#!/bin/bash

case $1 in
  test) bundle exec rspec ;;
  *) echo "not found" ;;
esac
