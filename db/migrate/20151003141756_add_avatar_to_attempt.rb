class AddAvatarToAttempt < ActiveRecord::Migration
  def up
  	add_attachment :attempts, :avatar
  end

  def down
  	remove_attachment :attempts, :avatar
  end
end
