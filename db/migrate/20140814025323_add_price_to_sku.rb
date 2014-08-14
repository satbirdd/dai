class AddPriceToSku < ActiveRecord::Migration
  def change
    add_column :skus, :price, :decimal, precision: 10, scale: 2
  end
end
