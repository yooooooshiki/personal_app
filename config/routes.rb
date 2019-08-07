Rails.application.routes.draw do
  resources :articles, only: [:index, :new]
  resources :users, only: [:index]
end
