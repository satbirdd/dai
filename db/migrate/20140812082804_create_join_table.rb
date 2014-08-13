class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :categories, :properties do |t|
      t.index [:property_id, :category_id]
    end
  end
end
