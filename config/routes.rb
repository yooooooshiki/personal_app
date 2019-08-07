Rails.application.routes.draw do
  root 'articles#index'
  resources :articles, only: [:index, :new, :show]
  resources :users, only: [:index]
end
