class AddDeletedAtColumnsToModels < ActiveRecord::Migration
  def change
    add_column :attempts, :deleted_at, :datetime
    add_column :drink_groups, :deleted_at, :datetime
    add_column :menu_groups, :deleted_at, :datetime
    add_column :news, :deleted_at, :datetime
    add_column :seasons, :deleted_at, :datetime
    add_column :users, :deleted_at, :datetime
    add_column :vouchers, :deleted_at, :datetime
  end
end
