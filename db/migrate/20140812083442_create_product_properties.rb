class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.references :product, index: true
      t.references :property, index: true
      t.references :property_item, index: true
      t.timestamps
    end
  end
end
