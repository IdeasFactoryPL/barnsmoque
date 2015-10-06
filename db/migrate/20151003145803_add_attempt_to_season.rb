class AddAttemptToSeason < ActiveRecord::Migration
  def change
  	add_reference :attempts, :season, index: true
  end
end
