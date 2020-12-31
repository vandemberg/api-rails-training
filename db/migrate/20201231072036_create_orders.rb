class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user
      t.float :price
      t.integer :interval
      t.string :product
      t.references :customer

      t.timestamps
    end
  end
end
