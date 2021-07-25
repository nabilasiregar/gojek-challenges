require 'sinatra'
require 'shotgun'
require_relative './models/item'

item_controller = ItemsController.new
get '/' do
  item_controller.index
end

get '/items/new' do
  item_controller.add
end

post '/create' do 
  item_controller.create(params)
  redirect '/'
end

get '/edit' do
  erb :edit
end

get '/details' do
  erb :details
end