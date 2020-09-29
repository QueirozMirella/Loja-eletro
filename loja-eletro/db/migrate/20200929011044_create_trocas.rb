class CreateTrocas < ActiveRecord::Migration[6.0]
  def change
    create_table :trocas do |t|
      t.text :defeito
      t.date :data_troca

      t.timestamps
    end
  end
end
