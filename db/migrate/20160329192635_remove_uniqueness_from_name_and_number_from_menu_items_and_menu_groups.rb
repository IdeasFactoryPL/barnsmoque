class RemoveUniquenessFromNameAndNumberFromMenuItemsAndMenuGroups < ActiveRecord::Migration
  def change
    [:menu_items, :menu_groups, :drink_items, :drink_groups].each do |table|
      remove_index table, [:number, :name]
      add_index table, [:number, :name]
    end
  end
end
