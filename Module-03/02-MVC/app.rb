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

get '/item/:id' do
  item_controller.show(params)
end

get '/item/:id/delete' do
  item_controller.destroy(params)
  redirect '/'
end