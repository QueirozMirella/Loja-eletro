require 'rails_helper'
require 'spec_helper'

RSpec.describe ProdutosController, :type => :controller do
    context "GET #index" do
        it "retornar com sucesso a pagina index" do
            get :index
            expect(response).to have_http_status(200)
            expect(response).to render_template(:index)  
        end

        it "retorna nenhum produto" do
            get :index
            expect(assigns(:produtos)).to be_empty
        end

        it "contem produto" do
            FactoryBot.create(:produto)
            get :index
            expect(assigns(:produtos)).to_not be_empty
        end
    end

    context "GET #show" do
        let(:produto) { FactoryBot.create(:produto) }
        it "retornar com sucesso a pagina show" do
            get :show, params: { id: produto.id }
            expect(response).to have_http_status(200)
            expect(response).to render_template(:show)
        end

        it "quando o produto tem id" do
            get :show, params: { id: produto.id }
            expect(assigns(:produto)).to eq(produto)
        end
    end

    context "GET #new" do
        it "retornar uma nova pagina" do
            get :new
            expect(response).to have_http_status(200)
            expect(response).to render_template(:new)
        end

        it "espera um novo produto" do
            get :new
            expect(assigns(:produto)).to be_a(Produto)
            expect(assigns(:produto)).to be_a_new(Produto)
        end
    end

    context "GET #edit" do
        let(:produto) { create(:produto) }
        it "renderiza a pagina edit" do
            get :edit, params: {id: produto.id}
            expect(response).to render_template(:edit)
        end
    end

    context "PUT #update" do
        let!(:produto) { create(:produto)}
        it "atualizar um produto" do
            params = { marca: "Electrolux" }
            put :update, params: { id: produto.id, produto: params}
            produto.reload
            expect(produto.marca).to eq(params[:marca])
            expect(flash[:notice]).to eq("Produto atualizado com sucesso.")
            expect(response).to redirect_to(action: :show, id: assigns(:produto).id)
        end

        it "nao atualiza um produto" do
            params = { marca: nil }
            put :update, params: { id: produto.id, produto:params }
            expect(response).to render_template(:edit)
        end
    end

    context "DELETE #destroy" do
        let!(:produto) { create(:produto) }
        it "deleta produto" do
            delete :destroy, params: {id: produto.id }
            expect(flash[:notice]).to eq("Produto excluído com sucesso.")
            expect(response).to redirect_to(action: :index)
        end
    end
end