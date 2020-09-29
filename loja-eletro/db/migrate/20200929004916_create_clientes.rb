class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.integer :codigo_cliente
      t.string :nome
      t.string :endereco

      t.timestamps
    end
  end
end
