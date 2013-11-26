# encoding: UTF-8

require 'json'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'

configure :development do
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/company.sqlite3"
end
configure :test do
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/company-test.sqlite3"
end

configure :production do
  set :datamapper_url, "mongodb://mongodb:12345@localhost/sinatra_service"
end

configure :production_mysql do
  set :datamapper_url, "mysql://root:12345@localhost/sinatra_service"
end

configure :production_postgres do
  set :datamapper_url, "postgres://postgres:12345@localhost/sinatra_service"
end

before do
  content_type 'application/json'
end

DataMapper.setup(:default, settings.datamapper_url)

require './data/init'
require './lib/init'
require './app/init'

DataMapper.finalize

