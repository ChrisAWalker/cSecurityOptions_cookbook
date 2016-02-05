require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'kitchen'

namespace :syntax do
  desc 'Check whether cookbook contains ruby syntax errors in .rb and .erb files'
  task :knife_syntax do
    puts 'Running knife cookbook test ... '
    sh 'knife cookbook test -a -o .'
    puts 'knife cookbook test FINISHED.'
  end
end

desc 'Run all syntax tests'
task syntax: ['syntax:knife_syntax']

namespace :style do
  # Ran into the following error:
  # FC009: Resource attribute not recognised: /network_interfaces/libraries/default.rb:223
  # This was due to the attribute 'guard_interpreter' in the powershell_script resources not being identified properly
  # https://github.com/acrmp/foodcritic/issues/233
  desc 'Test to make sure sure we follow basic style conventions'
  FoodCritic::Rake::LintTask.new(:foodcritic) do |t|
    t.options = { fail_tags: ['correctness'], tags: ['~FC009'] }
  end

  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new
end

desc 'Run all style tests'
task style: ['style:rubocop', 'style:foodcritic']

namespace :unit do
  desc 'Run rspec and chefspec tests'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'spec/**/*_spec.rb'
  end
end

desc 'Run all unit tests'
task unit: ['unit:spec']

namespace :integration do
  namespace :kitchen do
    desc 'Run Test Kitchen with Openstack'
    task :openstack do
      Kitchen.logger = Kitchen.default_file_logger
      Kitchen::Config.new.instances.each do |i|
        i.test(:always) if i.name.include? 'openstack'
      end
    end

    desc 'Run Test Kitchen with Vagrant'
    task :vagrant do
      Kitchen.logger = Kitchen.default_file_logger
      Kitchen::Config.new.instances.each do |i|
        i.test(:always) if i.name.include? 'vagrant'
      end
    end

    desc 'Run Test Kitchen with Chef11 Client'
    task :chef11 do
      Kitchen.logger = Kitchen.default_file_logger
      Kitchen::Config.new.instances.each do |i|
        i.test(:always) if i.name.start_with? 'windows'
      end
    end

    desc 'Run Test Kitchen with Chef12 Client'
    task :chef12 do
      Kitchen.logger = Kitchen.default_file_logger
      Kitchen::Config.new.instances.each do |i|
        i.test(:always) if i.name.start_with? 'chef12'
      end
    end
  end
end

# Blank integration testing due to outdated Jenkins
task integration: []

desc 'Run all tests'
task ci_merge: %w(syntax style unit)
task default: %w(syntax style unit)
task full: %w(syntax style unit integration:kitchen:vagrant)
task chef11: %w(syntax style unit integration:kitchen:chef11)
task chef12: %w(syntax style unit integration:kitchen:chef12)
