class SetNamesAndNumbersFromMenuGroupAndMenuItemAsUnique < ActiveRecord::Migration
  def change
    add_index :menu_items, [:number, :name], unique: true
    add_index :menu_groups, [:number, :name], unique: true
  end
end
