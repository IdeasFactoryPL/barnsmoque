class RemoveOrderFromMenuGroupAndDrinkGroupAndAddEnglishName < ActiveRecord::Migration
  def change
    remove_column :drink_groups, :order
    remove_column :menu_groups, :order
    add_column :drink_groups, :english_name, :string
    add_column :menu_groups, :english_name, :string
  end
end
