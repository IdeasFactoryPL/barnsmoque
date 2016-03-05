class AddStartDateAndEndDateToMenuGroupAndMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_groups, :start_date, :datetime
    add_column :menu_groups, :end_date, :datetime
    add_column :menu_items, :start_date, :datetime
    add_column :menu_items, :end_date, :datetime
  end
end
