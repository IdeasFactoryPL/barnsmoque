class RenameLinkTo < ActiveRecord::Migration
  def change
  	rename_column :news, :link_to, :link_for
  end
end
