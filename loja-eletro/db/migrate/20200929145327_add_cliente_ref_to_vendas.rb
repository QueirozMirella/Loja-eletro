class AddClienteRefToVendas < ActiveRecord::Migration[6.0]
  def change
    add_reference :vendas, :cliente, null: false, foreign_key: true
  end
end
