#!/bin/bash
#set -x

function log {
  echo "*** $1"
}

function ruby_environment {
  check_rvm
  check_ruby && \
  check_bundler
}

function load_rvm {
  [[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
}

function install_rvm {
  log "installing rvm"
  curl -L get.rvm.io | bash -s stable
  echo 'export rvm_project_rvmrc=1' >> $HOME/.rvmrc
  load_rvm
}

function check_rvm {
  load_rvm
  hash rvm || install_rvm
  log "rvm installed"
}

function install_ruby {
  log "installing ruby"
  rvm pkg install libxml2 && \
  rvm pkg install openssl && \
  rvm pkg install ncurses && \
  rvm pkg install readline && \
  rvm install ruby-1.8.7-p352 -C "--with-readline-dir=$HOME/.rvm/usr --with-xml-dir=$HOME/.rvm/usr --with-openssl-dir=$HOME/.rvm/usr " && \
  rvm use 1.8.7-p352 && \
  rvm gemset create session && \
  rvm use 1.8.7-p352@session
}

function check_ruby {
  rvm list | grep 1.8.7-p352 > /dev/null || install_ruby
  rvm use 1.8.7-p352@session
  log "ruby installed"
}

function install_bundler {
  log "installing bundler"
  gem install bundler --no-ri --no-rdoc
}

function check_bundler {
  which bundle | grep 1.8.7-p352 > /dev/null || install_bundler
  log "bundler installed"
}

ruby_environment && \
bundle install && \
bundle exec rake $@
