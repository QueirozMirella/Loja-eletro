class AddCodigoVendaToVenda < ActiveRecord::Migration[6.0]
  def change
    add_column :vendas, :codigo_venda, :integer
  end
end
