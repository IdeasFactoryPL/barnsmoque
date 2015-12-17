class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.string :english_name
      t.text :english_description
      t.string :price
      t.datetime :deleted_at
      t.belongs_to :menu_group, index: true
      
      t.timestamps null: false
    end
  end
end
