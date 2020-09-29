class Produto < ApplicationRecord
    validates_presence_of :marca, message: 'Não pode ser deixado em branco'
    validates_presence_of :codigo_produto, message: 'Não pode ser deixado em branco'
    validates_presence_of :modelo, message: 'Não pode ser deixado em branco'
    validates_presence_of :numero_serie, message: 'Não pode ser deixado em branco'
    validates_presence_of :quantidade, message: 'Não pode ser deixado em branco'

    validates :quantidade, numericality: { greater_than: 0, message: ' deve ser maior que 1' }
    validates :numero_serie, numericality: { greater_than: 0, message: ' deve ser maior que 1' }
    validates :codigo_produto, numericality: { greater_than: 0, message: ' deve ser maior que 1' }
end
