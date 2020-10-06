require 'rails_helper'

RSpec.describe Cliente, :type => :model do
    context "Validar cadastro do cliente" do
        it 'cadastro valido' do
            cliente = Cliente.new(codigo_cliente: '1234', nome: 'Mirella', endereco: 'rua teste, numero 989')
            expect(cliente).to be_valid
        end
        it 'cadastro não valido' do
            cliente = Cliente.new(codigo_cliente: '1234')
            expect(cliente).to_not be_valid
        end
    end
end
