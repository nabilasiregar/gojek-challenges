require 'mysql2'
require_relative './item'
require_relative './category'

def create_db_client
  client = Mysql2::Client.new(
    :host => "127.0.0.1",
    :username => "root",
    :password => "root",
    :database => "food_oms_db"
  )
  client
end

def get_all_items
  client = create_db_client
  rawData = client.query("SELECT * FROM items")
  items = Array.new
  rawData.each do |data|
    item = Item.new(data["id"], data["name"], data["price"])
    items.push(item)
  end
  items
end

def get_all_categories
  client = create_db_client
  rawData = client.query("SELECT * FROM categories")
  categories = Array.new
  rawData.each do |data|
    category = Category.new(data["id"], data["name"])
    categories.push(category)
  end
  categories
end

def get_all_items_with_categories
  client = create_db_client
  client.query("SELECT items.id, items.name, items.price, categories.id AS category_name
    FROM items 
    JOIN items_categories ON items.id = items_categories.item_id
    JOIN categories ON item_categories.category_id = categories.id")
    items = Array.new
    rawData.each do |data|
      category = Category.new(data["category_id"], data["category_name"])
      item = Item.new(data["id"], data["name"], data["price"], category)
      items.push(item)
    end
    items
end

def insert_item(name, price)
  client = create_db_client
  client.query("INSERT INTO items (name, price) VALUES ('#{name}', '#{price}'")
end

def insert_item_with_category(name, price, category_id)
  client = create_db_client
  client.query("INSERT INTO items (name, price) VALUES ('#{name}', '#{price}')")

  item_id = client.last_id
  client.query("INSERT INTO item_categories (item_id, category_id) VALUES ('#{item_id}', '#{category_id}')")
end