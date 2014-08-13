class SkuProperty < ActiveRecord::Base
  belongs_to :sku
  belongs_to :stock_property
  belongs_to :stock_propery_item
end
