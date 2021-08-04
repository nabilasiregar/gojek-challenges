require 'erb'
require_relative '../models/category'

class CategoriesController
  # GET /categories
  def list_categories
    categories = Category.get_all_categories
    renderer = ERB.new(File.read('./views/categories/index.erb'))
    renderer.result(binding)
  end

   # GET /categories/new
   def add_category
    categories = Category.get_all_categories
    renderer = ERB.new(File.read('./views/categories/create.erb'))
    renderer.result(binding)
  end

  # POST /categories
  def create_category(params)
    category = Category.save(params['name'])
  end
end