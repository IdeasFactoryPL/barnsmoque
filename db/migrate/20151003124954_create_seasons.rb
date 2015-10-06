class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.text :description
      t.integer :number
      t.text :html_code

      t.timestamps null: false
    end
  end
end
