class Product < ActiveRecord::Base
	belongs_to :category
	has_many :items
	has_many :product_properties

	accepts_nested_attributes_for :product_properties
end
