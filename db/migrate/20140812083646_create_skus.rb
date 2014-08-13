class CreateSkus < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.references :item, index: true
      t.string :name, limit: 255
      t.integer :inventory
      t.timestamps
    end
  end
end
