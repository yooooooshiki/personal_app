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
    member do #本一覧画面からお気に入り登録をする
      post "add", to: "favorites#create"
    end
  end

  resources :favorites, only: [:destroy]

  resources :searches, only: [:index, :show]
  resource :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:show]
  devise_scope :user do
    get 'sign_up', to: 'users/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
