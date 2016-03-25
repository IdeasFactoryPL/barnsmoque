class AddStartDateEndDateNumberToDrinkGroupAndDrinkItem < ActiveRecord::Migration
  def change
    add_column :drink_groups, :number, :integer, unique: true
    add_column :drink_items, :number, :integer, unique: true
    add_column :drink_groups, :start_date, :datetime
    add_column :drink_groups, :end_date, :datetime
    add_column :drink_items, :start_date, :datetime
    add_column :drink_items, :end_date, :datetime

    add_index :drink_items, [:number, :name], unique: true
    add_index :drink_groups, [:number, :name], unique: true
  end
end
