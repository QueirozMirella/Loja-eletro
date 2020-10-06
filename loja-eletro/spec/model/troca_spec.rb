require 'rails_helper'

RSpec.describe Troca, :type => :model do
    context "Validar cadastro da Troca" do
        it 'cadastro valido' do
            troca = Troca.new(defeito: 'testando',
                data_troca: '2020/04/04')
            expect(troca).to be_valid
        end
        it 'cadastro não valido' do
            troca = Troca.new(defeito: 'testando',
                data_troca: '')
            expect(troca).to_not be_valid
        end
    end
end
