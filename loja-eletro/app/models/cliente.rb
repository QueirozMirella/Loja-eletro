class Cliente < ApplicationRecord
    validates_presence_of :codigo_cliente, message: 'Não pode ser deixado em branco'
    validates_presence_of :nome, message: 'Não pode ser deixado em branco'
    validates_presence_of :endereco, message: 'Não pode ser deixado em branco'
end
