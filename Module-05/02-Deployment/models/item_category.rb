class ItemCategory
  attr_accessor :item, :category
  
  def initialize(item, category)
    @item = item
    @category = category
  end

  def self.create(item, category)
    client = create_db_client
    item_category = ItemCategory.new(item, category)
    return unless item_category.valid?
    client.query("
      INSERT INTO item_categories (item_id, category_id) VALUES ('#{item_category.item.id}', '#{item_category.category.id}') 
      ")
    item_category
  end

  def self.find_by_item(item)
    return if item.nil?
    client = create_db_client
    result = client.query("
      SELECT * FROM item_categories WHERE item_id = '#{item}' ")
    data = result.first
    return if data.nil?

    category = Category.find_by_id(data['category_id'])
    ItemCategory.new(item, category)
  end

  def self.update(item, category)
    return unless valid?
    client = create_db_client
    result = ItemCategory.client.query("
      UPDATE item_categories SET category_id='#{category.id}' WHERE item_id='#{item.id}'
      ")
    result
  end

  def self.delete(item, category)
    client = create_db_client
    client.query("DELETE FROM item_categories WHERE item_id=#{item.id} and category_id=#{category.id}")
  end

  def valid?
    return false if @item.nil?
    return false if @category.nil?
    @item.valid? and @category.valid?
  end
end