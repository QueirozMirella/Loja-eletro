require 'rails_helper'

RSpec.describe ClientesController, :type => :controller do
    context "GET #index" do
        it "retornar com sucesso a pagina index" do
            get :index
            expect(response).to have_http_status(200)
            expect(response).to render_template(:index)  
        end

        it "retorna nenhum cliente" do
            get :index
            expect(assigns(:clientes)).to be_empty
        end

        it "contem cliente" do
            FactoryBot.create(:cliente)
            get :index
            expect(assigns(:clientes)).to_not be_empty
        end
    end

    context "GET #show" do
        let(:cliente) { FactoryBot.create(:cliente) }
        it "retornar com sucesso a pagina show" do
            get :show, params: { id: cliente.id }
            expect(response).to have_http_status(200)
            expect(response).to render_template(:show)
        end

        it "quando o cliente tem id" do
            get :show, params: { id: cliente.id }
            expect(assigns(:cliente)).to eq(cliente)
        end

    end
end