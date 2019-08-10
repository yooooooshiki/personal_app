Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles
  resources :users, only: [:index]
  devise_scope :user do
    get 'sign_up', to: 'users/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
