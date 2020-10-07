=begin
require 'rails_helper'
require 'spec_helper'

RSpec.describe VendasController, :type => :controller do
    context "GET #index" do
        it "retornar com sucesso a pagina index" do
            get :index
            expect(response).to have_http_status(200)
            expect(response).to render_template(:index)  
        end

        it "retorna nenhuma venda" do
            get :index
            expect(assigns(:vendas)).to be_empty
        end

        it "contem venda" do
            FactoryBot.create(:venda)
            get :index
            expect(assigns(:vendas)).to_not be_empty
        end
    end

    context "GET #show" do
        let(:venda) { FactoryBot.create(:venda) }
        it "retornar com sucesso a pagina show" do
            get :show, params: { id: venda.id }
            expect(response).to have_http_status(200)
            expect(response).to render_template(:show)
        end

        it "quando a venda tem id" do
            get :show, params: { id: venda.id }
            expect(assigns(:venda)).to eq(venda)
        end
    end

    context "GET #new" do
        it "retornar uma nova pagina" do
            get :new
            expect(response).to have_http_status(200)
            expect(response).to render_template(:new)
        end

        it "espera uma nova venda" do
            get :new
            expect(assigns(:venda)).to be_a(Venda)
            expect(assigns(:venda)).to be_a_new(Venda)
        end
    end

    context "GET #edit" do
        let(:venda) { create(:venda) }
        it "renderiza a pagina edit" do
            get :edit, params: {id: venda.id}
            expect(response).to render_template(:edit)
        end
    end

    context "PUT #update" do
        let!(:venda) { create(:venda)}
        it "atualizar uma venda" do
            params = { codigo_venda: "4567" }
            put :update, params: { id: venda.id, venda: params}
            venda.reload
            expect(venda.codigo_venda).to eq(params[:codigo_venda])
            expect(flash[:notice]).to eq("Venda atualizada com sucesso.")
            expect(response).to redirect_to(action: :show, id: assigns(:venda).id)
        end

        it "nao atualiza uma venda" do
            params = { codigo_venda: nil }
            put :update, params: { id: venda.id, venda:params }
            expect(response).to render_template(:edit)
        end
    end

    context "DELETE #destroy" do
        let!(:venda) { create(:venda) }
        it "deleta venda" do
            delete :destroy, params: {id: venda.id }
            expect(flash[:notice]).to eq("Venda excluida com sucesso.")
            expect(response).to redirect_to(action: :index)
        end
    end
end
=end
