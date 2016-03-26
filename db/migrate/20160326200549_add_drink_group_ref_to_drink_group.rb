class AddDrinkGroupRefToDrinkGroup < ActiveRecord::Migration
  def change
    add_reference :drink_groups, :drink_group, index: true, foreign_key: true
  end
end
