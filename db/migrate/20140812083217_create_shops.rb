class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :owner_id
      t.string :name

      t.timestamps
    end
  end
end
