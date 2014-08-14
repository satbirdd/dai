class Sku < ActiveRecord::Base
  belongs_to :item

  has_many :sku_properties
  accepts_nested_attributes_for :sku_properties
end
