class StockProperty < ActiveRecord::Base
	has_and_belongs_to_many :properties
	has_many :stock_property_items
end
