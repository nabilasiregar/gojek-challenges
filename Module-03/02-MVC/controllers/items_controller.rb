require 'erb'
require_relative '../models/item'
require_relative '../models/category'

class ItemsController

  # GET /items
  def list_items
    items = Item.get_all_items
    renderer = ERB.new(File.read('./views/items/menu.erb'))
    renderer.result(binding)
  end

  # GET /item/1
  def show(params)
    item = Item.find_by_id(params['id'])
    renderer = ERB.new(File.read('./views/items/show.erb'))
    renderer.result(binding)
  end

  # GET /items/new
  def add
    categories = Category.get_all_categories
    renderer = ERB.new(File.read('./views/items/create.erb'))
    renderer.result(binding)
  end

  # POST /items
  def create(params)
    item = Item.create_item(params['name'], params['price'], params['category_id'])
  end

  def destroy(params)
    
  end
end