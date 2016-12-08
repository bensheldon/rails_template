create_file '.ruby-version', '2.3.1'
inject_into_file 'Gemfile', after: "source 'https://rubygems.org'\n" do
  <<~RUBY
    ruby File.read(File.join(File.dirname(__FILE__), \".ruby-version\")).strip
  RUBY
end

gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'pry-rails'
gem 'slim-rails'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

gem_group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'poltergeist'
end

gem_group :development do
  gem 'annotate'
end

run 'bin/rails generate rspec:install'
run 'bundle binstubs rspec-core'
