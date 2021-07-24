require 'sinatra'
require 'sinatra/reloader'
require_relative './db_connector'

get '/' do 
  items = get_all_items
  erb :index, locals: {
    items: items
  }
end

get '/items/new' do
  categories = get_all_categories
    erb :create, locals: {
        categories: categories
    }
end

post '/items' do 
  name = params['name']
  price = params['price']
  category_id = params['category_id']
  insert_item(name, price, category_id)
  redirect '/'
end

get '/item/:id/delete' do
  id = params[:id]
  delete_item(id)
  redirect "/"
end

