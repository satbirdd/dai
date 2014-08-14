class StockPropertyItem < ActiveRecord::Base
  belongs_to :stock_property
  has_many :sku_properties
end
