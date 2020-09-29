class RemoveQuantidadeFromProdutos < ActiveRecord::Migration[6.0]
  def change
    remove_column :produtos, :quantidade, :integer
  end
end
