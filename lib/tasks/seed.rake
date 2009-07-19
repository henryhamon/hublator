require 'yaml'
desc 'Populate the database with seed data, the minimum data to get the app running'

destiny = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config', 'database.yml')))

dump = lambda do |environment|
  params = destiny[environment.to_s]
  sql = File.expand_path(File.join(File.dirname(__FILE__), '..', 'states_and_cities.sql'))
  system("mysqldump -u#{params['username']} -p#{params['password']} #{params['database']} < #{sql}")
end

namespace :db do
  namespace :seed do

    task :development do
      dump.call(:development)
    end

    task :test do
      dump.call(:test)
    end

    task :production do
      dump.call(:production)
    end

  end
end

