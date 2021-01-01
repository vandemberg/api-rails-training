class AddNumberPieceToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :number_piece, :integer
  end
end
