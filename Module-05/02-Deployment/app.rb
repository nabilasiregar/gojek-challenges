require 'sinatra'
require_relative './controllers/categories_controller'
require_relative './controllers/items_controller'

item_controller = ItemsController.new
get '/' do
  item_controller.list_items
end

get '/items/new' do
  item_controller.add_item
end

post '/item/create' do 
  item_controller.create_item(params)
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

get '/categories/new' do
  category_controller.add_category
end

post '/category/create' do 
  category_controller.create_category(params)
  redirect '/categories'
end