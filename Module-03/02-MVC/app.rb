require 'sinatra'
require 'shotgun'
require_relative './models/item'

get '/' do
  controller = ItemsController.new
  controller.index
end

get '/edit' do
  erb :edit
end

get '/details' do
  erb :details
end