require 'sinatra'
require_relative './controllers/categories_controller'
require_relative './controllers/items_controller'

item_controller = ItemsController.new
get '/' do
  item_controller.list_items
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

category_controller = CategoriesController.new
get '/categories' do
  category_controller.list_categories
end