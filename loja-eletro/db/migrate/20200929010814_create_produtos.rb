class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.integer :codigo_produto
      t.string :marca
      t.string :modelo
      t.integer :numero_serie

      t.timestamps
    end
  end
end
