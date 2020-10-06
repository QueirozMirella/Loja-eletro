require 'rails_helper'

RSpec.describe Venda, :type => :model do
    context "Validar cadastro da Venda" do
        it 'cadastro valido' do
            venda = Venda.new(codigo_venda: '1234',
                data_venda: '2020/04/04',
            )
            expect(venda).to be_valid
        end
        it 'cadastro não valido' do
            venda = Venda.new(codigo_venda: '',
                data_venda: '2020/04/04',
            )
            expect(venda).to_not be_valid
        end
    end
end