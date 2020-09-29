class CreateVendas < ActiveRecord::Migration[6.0]
  def change
    create_table :vendas do |t|
      t.date :data_venda

      t.timestamps
    end
  end
end
