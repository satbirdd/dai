class Shop < ActiveRecord::Base
	belongs_to :owner, class_name: 'User'
	has_many :items
end
