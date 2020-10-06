require 'rails_helper'

RSpec.describe Produto, :type => :model do
    context "Validar cadastro do produto" do
        it 'cadastro valido' do
            produto = Produto.new(marca: 'consul',
                codigo_produto: '985747', 
                modelo: 'teste',
                numero_serie: '6254783')
            expect(produto).to be_valid
        end
        it 'cadastro não valido' do
            produto = Produto.new(marca: 'consul',
                )
            expect(produto).to_not be_valid
        end
    end
end