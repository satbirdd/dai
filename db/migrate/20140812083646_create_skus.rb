class CreateSkus < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.references :line_item, index: true
      t.references :stock_property, index: true
      t.references :stock_property_item, index: true

      t.timestamps
    end
  end
end
