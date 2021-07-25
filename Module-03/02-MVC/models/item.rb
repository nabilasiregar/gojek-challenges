require_relative '../db/db_connector.rb'
require 'pry'

class Item
  attr_accessor :id, :name, :price, :category

  def initialize(id, name, price, category=nil)
    @id = id
    @name = name
    @price = price
    @category = category
  end

  def self.get_all_items
    client = create_db_client
    raw_data = client.query("
      SELECT i.id, i.name, i.price, c.name AS 'category_name'
      FROM items i
      LEFT JOIN item_categories ic ON i.id = ic.item_id
      LEFT JOIN categories c ON ic.category_id = c.id")
    items = Array.new
    raw_data.each do |item|
      new_item = Item.new(item["id"], item["name"], item["price"], item["category_name"])
      items.push(new_item)
    end
    items
  end

  def self.create_item(name, price, category_id)
    client = create_db_client
    client.query("INSERT INTO items (name, price) VALUES ('#{name}', '#{price}')")
    item_id = client.last_id
    client.query("INSERT INTO item_categories (item_id, category_id) values ('#{item_id}', '#{category_id}')")
  end

  def self.find_by_id(id)
    client = create_db_client
    result = client.query("
      SELECT i.id, i.name, i.price, c.name AS 'category_name'
      FROM items i
      LEFT JOIN item_categories ic ON i.id = ic.item_id
      LEFT JOIN categories c ON ic.category_id = c.id
      WHERE i.id = #{id}
      ")
      data = result.first
    
      item = Item.new(data['id'], data['name'], data['price'], data['category_name'])
      item
     
  end
end
