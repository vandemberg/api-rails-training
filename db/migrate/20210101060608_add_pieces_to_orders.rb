class AddPiecesToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :pieces, :integer
  end
end
