require_relative '../db/db_connector.rb'
require_relative './item_category'
require 'pry'

class Item
  attr_accessor :id, :name, :price, :category

  def initialize(id, name, price, category=nil)
    @id = id
    @name = name
    @price = price
    @category = category
  end

  def valid?
    return false if @name.nil?
    return false if @price.nil
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

  def save
    client = create_db_client
    client.query("INSERT INTO items (name, price) VALUES ('#{@name}', '#{@price}')")
    @item_id = client.last_id
    client.query("INSERT INTO item_categories (item_id, category_id) values ('#{@item_id}', '#{@category_id}')")
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

  def self.delete(id)
    item_category = ItemCategory.find_by_item(id)
    item_category.delete(id) unless category.nil?
    client = create_db_client
    client.query("DELETE FROM items WHERE id=#{id}")
  end
end
