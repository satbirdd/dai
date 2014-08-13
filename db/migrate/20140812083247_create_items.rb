class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :product, index: true
      t.references :shop, index: true

      t.timestamps
    end
  end
end
