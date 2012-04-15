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
  bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
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
  rvm install ruby-1.8.7-p352 && \
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
bundle exec rake $@
