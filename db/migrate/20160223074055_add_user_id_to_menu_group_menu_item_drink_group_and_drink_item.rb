class AddUserIdToMenuGroupMenuItemDrinkGroupAndDrinkItem < ActiveRecord::Migration
  def change
    add_reference :menu_groups, :user, index: true, foreign_key: true
    add_reference :menu_items, :user, index: true, foreign_key: true
    add_reference :drink_groups, :user, index: true, foreign_key: true
    add_reference :drink_items, :user, index: true, foreign_key: true
  end
end
