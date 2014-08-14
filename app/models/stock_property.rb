class StockProperty < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_many :stock_property_items

	accepts_nested_attributes_for :stock_property_items

	has_many :sku_properties
end
