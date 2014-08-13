class CreateJoinTable2 < ActiveRecord::Migration
  def change
    create_join_table :categories, :stock_properties do |t|
      t.index :category_id
      t.index :stock_property_id
    end
  end
end
