require 'erb'
require_relative '../models/category'

class CategoriesController
  # GET /categories
  def list_categories
    categories = Category.get_all_categories
    renderer = ERB.new(File.read('./views/categories/index.erb'))
    renderer.result(binding)
  end
end