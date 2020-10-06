class Troca < ApplicationRecord
    validates_presence_of :defeito, message: 'Não pode ser deixado em branco'
    validates_presence_of :data_troca, message: 'Não pode ser deixado em branco'
end
