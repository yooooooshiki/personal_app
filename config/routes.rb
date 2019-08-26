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

  resources :articles do
    resources :favorites, only: [:create, :destroy]
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]


  # resources :favorites, only: [:destroy]

  resources :searches, only: [:index, :show]
  # resource :sessions, only: [:new, :create, :destroy]

  resources :users
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
