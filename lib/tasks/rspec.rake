begin

  require 'rspec/core'
  require 'rspec/core/rake_task'

  spec_prereq = Rails.configuration.generators.options[:rails][:orm] == :active_record ? "db:test:prepare" : :noop
  task :noop do
  end

  Rake.application.instance_variable_get('@tasks').delete('spec')

  task :spec => ['spec:spec']

  namespace :spec do

    spec_opts = ['--profile', '--color']

    desc "Run all specs with rcov"
    RSpec::Core::RakeTask.new(:verify_rcov => spec_prereq) do |t|
      t.rcov = true
      t.pattern = "./spec/**/*_spec.rb"
      t.rcov_opts = ['--exclude spec/,/gems/,/Library/,/usr/,lib/tasks,.bundle,config,/lib/rspec/,/lib/rspec-,cp-domain/,cp-auth-sso/', '--rails', '--failure-threshold=97']
      t.rspec_opts = spec_opts
    end

    desc "Run all database tests"
    RSpec::Core::RakeTask.new(:database_reliant => spec_prereq) do |t|
      t.pattern = "./spec"
      t.rspec_opts = spec_opts + ['--tag', 'database_reliant']
    end

    desc "Run all non database tests"
    RSpec::Core::RakeTask.new(:non_database_reliant => spec_prereq) do |t|
      t.pattern = "./spec"
      t.rspec_opts = spec_opts + ['--tag', '~database_reliant', '-r', './spec/database_exploder.rb']
    end

    desc "Run all spec tests"
    RSpec::Core::RakeTask.new(:spec => spec_prereq) do |t|
      t.pattern = "./spec"
      t.rspec_opts = spec_opts
    end

    desc "Run all specs but with smartness"
    multitask :parallel => ['spec:database_reliant', 'spec:non_database_reliant']

  end

rescue LoadError => e
  namespace :spec do
    desc "RSpec tasks not available (#{e})"
    task :spec do
      abort e
    end
  end
end
