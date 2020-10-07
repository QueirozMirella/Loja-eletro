require 'rails_helper'
require 'spec_helper'

RSpec.describe TrocasController, :type => :controller do
    context "GET #index" do
        it "retornar com sucesso a pagina index" do
            get :index
            expect(response).to have_http_status(200)
            expect(response).to render_template(:index)  
        end

        it "retorna nenhum troca" do
            get :index
            expect(assigns(:trocas)).to be_empty
        end

        it "contem troca" do
            FactoryBot.create(:troca)
            get :index
            expect(assigns(:trocas)).to_not be_empty
        end
    end

    context "GET #show" do
        let(:troca) { FactoryBot.create(:troca) }
        it "retornar com sucesso a pagina show" do
            get :show, params: { id: troca.id }
            expect(response).to have_http_status(200)
            expect(response).to render_template(:show)
        end

        it "quando o troca tem id" do
            get :show, params: { id: troca.id }
            expect(assigns(:troca)).to eq(troca)
        end
    end

    context "GET #new" do
        it "retornar uma nova pagina" do
            get :new
            expect(response).to have_http_status(200)
            expect(response).to render_template(:new)
        end

        it "espera um novo troca" do
            get :new
            expect(assigns(:troca)).to be_a(Troca)
            expect(assigns(:troca)).to be_a_new(Troca)
        end
    end

    context "GET #edit" do
        let(:troca) { create(:troca) }
        it "renderiza a pagina edit" do
            get :edit, params: {id: troca.id}
            expect(response).to render_template(:edit)
        end
    end

    context "PUT #update" do
        let!(:troca) { create(:troca)}
        it "atualizar um troca" do
            params = { defeito: "testando" }
            put :update, params: { id: troca.id, troca: params}
            troca.reload
            expect(troca.defeito).to eq(params[:defeito])
            expect(flash[:notice]).to eq("Troca atualizada com sucesso.")
            expect(response).to redirect_to(action: :show, id: assigns(:troca).id)
        end

        it "nao atualiza um troca" do
            params = { defeito: nil }
            put :update, params: { id: troca.id, troca:params }
            expect(response).to render_template(:edit)
        end
    end

    context "DELETE #destroy" do
        let!(:troca) { create(:troca) }
        it "deleta troca" do
            delete :destroy, params: {id: troca.id }
            expect(flash[:notice]).to eq("Troca excluida com sucesso.")
            expect(response).to redirect_to(action: :index)
        end
    end
end
