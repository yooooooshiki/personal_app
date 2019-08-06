Rails.application.routes.draw do
  get 'articles' => 'articles#index'
  resources :users, only: [:index]
end
