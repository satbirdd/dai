class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 255
      t.string :ancestry, limit: 255

      t.timestamps
    end
  end
end
