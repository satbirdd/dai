class CreateStockPropertyItems < ActiveRecord::Migration
  def change
    create_table :stock_property_items do |t|
      t.references :stock_property, index: true
      t.string :name

      t.timestamps
    end
  end
end
