require 'rails_helper'
require 'spec_helper'

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

    context "GET #new" do
        it "retornar uma nova pagina" do
            get :new
            expect(response).to have_http_status(200)
            expect(response).to render_template(:new)
        end

        it "espera um novo cliente" do
            get :new
            expect(assigns(:cliente)).to be_a(Cliente)
            expect(assigns(:cliente)).to be_a_new(Cliente)
        end
    end

    context "GET #edit" do
        let(:cliente) { create(:cliente) }
        it "renderiza a pagina edit" do
            get :edit, params: {id: cliente.id}
            expect(response).to render_template(:edit)
        end
    end

    context "PUT #update" do
        let!(:cliente) { create(:cliente)}
        it "atualizar um cliente" do
            params = { nome: "Maria" }
            put :update, params: { id: cliente.id, cliente: params}
            cliente.reload
            expect(cliente.nome).to eq(params[:nome])
            expect(flash[:notice]).to eq("Cliente atualizado com sucesso.")
            expect(response).to redirect_to(action: :show, id: assigns(:cliente).id)
        end

        it "nao atualiza um cliente" do
            params = { nome: nil }
            put :update, params: { id: cliente.id, cliente:params }
            expect(response).to render_template(:edit)
        end
    end

    context "DELETE #destroy" do
        let!(:cliente) { create(:cliente) }
        it "deleta cliente" do
            delete :destroy, params: {id: cliente.id }
            expect(flash[:notice]).to eq("Cliente excluído com sucesso.")
            expect(response).to redirect_to(action: :index)
        end
    end
end