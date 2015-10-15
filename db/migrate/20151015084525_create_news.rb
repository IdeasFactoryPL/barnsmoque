class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :link_name
      t.string :link_to
      t.date :release_date
      t.timestamps null: false
    end
  end
end
