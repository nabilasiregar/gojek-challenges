require_relative '../db/db_connector.rb'

class Category
  attr_reader :id, :name
  
  def initialize(id, name)
    @id = id
    @name = name
  end
  
  def self.get_all_categories
    client = create_db_client
    raw_data = client.query("SELECT * FROM categories")
    categories = Array.new
    raw_data.each do |data|
      category = Category.new(data["id"], data["name"])
      categories.push(category)
    end
    categories
  end
end