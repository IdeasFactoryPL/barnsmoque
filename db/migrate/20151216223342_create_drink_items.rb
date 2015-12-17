class CreateDrinkItems < ActiveRecord::Migration
  def change
    create_table :drink_items do |t|
      t.string :name
      t.text :description
      t.string :english_name
      t.text :english_description
      t.string :price
      t.datetime :deleted_at
      t.belongs_to :drink_group, index: true

      t.timestamps null: false
    end
  end
end
