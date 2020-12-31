class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.date :pay_day
      t.float :total
      t.float :value_payed
      t.float :interest

      t.timestamps
    end
  end
end
