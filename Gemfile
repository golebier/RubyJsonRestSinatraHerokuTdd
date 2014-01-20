source 'https://rubygems.org'

gem 'sinatra', '1.4.4'
gem 'json', '1.7.4'
gem 'data_mapper', '1.2.0'
#gem 'dm-mongodb-adapter'
gem 'sinatra-contrib'
gem 'dm-core'
gem 'dm-validations'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'sinatra-cross_origin'

# When developing an app locally you can use SQLite which is a relational
# database stored in a file. It's easy to set up and just fine for most
# development situations.
group :development, :test do
  gem 'dm-sqlite-adapter', '1.2.0'
  gem 'debugger'
  gem 'timecop'
  gem 'simplecov'
end

# Heroku uses Postgres however, so we tell the Gemfile to use Postgres
# in production instead of SQLite.
group :production do
  gem 'dm-postgres-adapter', '1.2.0'
end


