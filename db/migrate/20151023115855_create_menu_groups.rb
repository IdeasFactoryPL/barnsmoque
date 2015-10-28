class CreateMenuGroups < ActiveRecord::Migration
  def change
    create_table :menu_groups do |t|
      t.string :name
      t.integer :order

      t.timestamps null: false
    end
  end
end
