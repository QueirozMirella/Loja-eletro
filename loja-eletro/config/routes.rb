Rails.application.routes.draw do
  root 'home#index'
  resources :trocas
  resources :produtos
  resources :vendas
  resources :clientes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
