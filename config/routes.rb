Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  # delete '/articles/:article_id/likes/:id', to: 'likes#destroy' ,as: :like
  
  resources :articles do
    resources :likes, only: [:create, :destroy] 
  end

  resources :articles do
    resources :comments
  end

  resources :searches, only: [:index]
  resources :users, only: [:index]
  devise_scope :user do
    get 'sign_up', to: 'users/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
