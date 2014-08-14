class CreateSkuProperties < ActiveRecord::Migration
  def change
    create_table :sku_properties do |t|
      t.references :sku, index: true
      t.references :stock_property, index: true
      t.references :stock_property_item, index: true

      t.timestamps
    end
  end
end
