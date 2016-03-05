class AddNumberToMenuGroupAndMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_groups, :number, :integer, unique: true
    add_column :menu_items, :number, :integer, unique: true
  end
end
