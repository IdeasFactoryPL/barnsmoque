class ChangeTypeOfReleaseDate < ActiveRecord::Migration
  def change
  	change_column :news, :release_date, :datetime
  end
end
