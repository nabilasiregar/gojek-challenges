require 'erb'
require_relative '../models/item'

class ItemsController

  # GET /items
  def index
    items = Item.get_all_items
    renderer = ERB.new(File.read('./views/menu.erb'))
    renderer.result(binding)
  end

  # GET /item/1
  def show
  end

  # GET /items/add
  def add
    
  end

  # POST /items
  def create
  end
end