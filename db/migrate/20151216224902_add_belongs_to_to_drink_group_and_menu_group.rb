class AddBelongsToToDrinkGroupAndMenuGroup < ActiveRecord::Migration
  def change
    add_reference :drink_groups, :drink_group, index: true
    add_reference :menu_groups, :menu_group, index: true
  end
end
