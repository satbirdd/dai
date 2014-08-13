class Category < ActiveRecord::Base
	has_many :products

	has_and_belongs_to_many :properties

	has_and_belongs_to_many :stock_properties
end
