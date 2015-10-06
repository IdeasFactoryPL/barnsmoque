class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.string :name
      t.string :surname
      t.integer :minute
      t.integer :second
      t.integer :hundredths_of_second

      t.timestamps null: false
    end
  end
end
