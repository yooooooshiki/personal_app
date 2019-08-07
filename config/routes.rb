Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles, only: [:index, :new, :show]
  resources :users, only: [:index]
end
