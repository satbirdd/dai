class CreateStockProperties < ActiveRecord::Migration
  def change
    create_table :stock_properties do |t|
      t.string :name

      t.timestamps
    end
  end
end
