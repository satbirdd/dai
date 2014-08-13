class Property < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_many :property_items

	accepts_nested_attributes_for :property_items
end
