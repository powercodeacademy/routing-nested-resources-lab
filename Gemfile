source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.5"

gem 'rails', '~> 7.1.0'
gem 'sprockets-rails', '>= 2.0.0'
gem 'sqlite3', '~> 1.4'
gem 'puma', '>= 6.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'bootsnap', require: false
gem 'ostruct'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'pry'
  gem 'capybara'
  gem 'rspec-rails', '~> 6.0'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'web-console'
end
