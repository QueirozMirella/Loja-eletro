class Produto < ApplicationRecord
    validates_presence_of :marca, message: 'Não pode ser deixado em branco'
    validates_presence_of :codigo_produto, message: 'Não pode ser deixado em branco'
    validates_presence_of :modelo, message: 'Não pode ser deixado em branco'
    validates_presence_of :numero_serie, message: 'Não pode ser deixado em branco'

end
