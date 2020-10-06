class Venda < ApplicationRecord
    validates_presence_of :data_venda, message: 'Não pode ser deixado em branco'
    validates_presence_of :codigo_venda, message: 'Não pode ser deixado em branco'
end
