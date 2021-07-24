require 'mysql2'
require_relative './item'
require_relative './category'

def create_db_client
  client = Mysql2::Client.new(
    :host => "localhost",
    :username => ENV["DB_USERNAME"],
    :password => ENV["DB_PASSWORD"],
    :database => ENV["DB_NAME"]
  )
  client
end

def get_item(id)
  client = create_db_client
  raw_data = client.query ("
    SELECT items.id, items.name, items.price, categories.id category_id, categories.name category_name
    FROM items
    LEFT JOIN item_categories on items.id = item_categories.item_id
    LEFT JOIN categories on item_categories.category_id = category.id
    WHERE items.id = #{id}
  ").first
  item = Item.new(raw_data['id'], raw_data['name'], raw_data['price'], raw_data['category_name'])
end

def get_all_items
  client = create_db_client
  raw_data = client.query("SELECT * FROM items")
  items = Array.new
  raw_data.each do |data|
    item = Item.new(data["id"], data["name"], data["price"])
    items.push(item)
  end
  items
end

def get_all_categories
  client = create_db_client
  raw_data = client.query("SELECT * FROM categories")
  categories = Array.new
  raw_data.each do |data|
    category = Category.new(data["id"], data["name"])
    categories.push(category)
  end
  categories
end

def get_all_items_with_categories
  client = create_db_client
  client.query("SELECT items.id, items.name, items.price, categories.id AS category_name
    FROM items 
    LEFT JOIN item_categories ON items.id = item_categories.item_id
    LEFT JOIN categories ON item_categories.category_id = categories.id")
    items = Array.new
    raw_data.each do |data|
      item = Item.new(data["id"], data["name"], data["price"], data["category_name"])
      items.push(item)
    end
    items
end

def insert_item(name, price, category_id)
  client = create_db_client
  client.query("INSERT INTO items (name, price) VALUES ('#{name}', '#{price}')")
  item_id = client.last_id
  client.query("insert into item_categories (item_id, category_id) values ('#{item_id}', '#{category_id}')")
end

def delete_item(id)
  client = create_db_client
  client.query("DELETE FROM items WHERE id=#{id}")
  client.query("DELETE FROM item_categories WHERE item_id=#{id}")
end