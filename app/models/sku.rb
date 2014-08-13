class Sku < ActiveRecord::Base
  belongs_to :line_item
  belongs_to :stock_property
  belongs_to :stock_property_item
end
