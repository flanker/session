#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'jasmine'

Session::Application.load_tasks
Dir.glob('tasks/*.rake').each { |task| load task }

task :ci => ['db:migrate', 'db:test:prepare', :spec, :cucumber]
task :default => [:ci]
