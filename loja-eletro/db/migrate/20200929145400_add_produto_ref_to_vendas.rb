class AddProdutoRefToVendas < ActiveRecord::Migration[6.0]
  def change
    add_reference :vendas, :produto, null: false, foreign_key: true
  end
end
