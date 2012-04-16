begin

  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = ["features"]
  end

rescue LoadError => e
  desc "cucumber tasks not available (#{e})"
  task :cucumber do
    abort e
  end
end
