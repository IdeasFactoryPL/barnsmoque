class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.string :status
      t.string :code

      t.timestamps null: false
    end
  end
end
