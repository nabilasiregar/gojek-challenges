require 'mysql2'
require_relative '../controllers/items_controller'

def create_db_client
  client = Mysql2::Client.new(
    :host => "localhost",
    :username => "root",
    :password => "root",
    :database => "food_oms_db"
  )
  client
end
