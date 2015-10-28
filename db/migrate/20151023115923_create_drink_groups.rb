class CreateDrinkGroups < ActiveRecord::Migration
  def change
    create_table :drink_groups do |t|
      t.string :name
      t.integer :order

      t.timestamps null: false
    end
  end
end
