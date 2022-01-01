Rails.application.routes.draw do
  devise_for :users
  resources :tasks do
    get 'sort', on: :collection
  end
  root 'home#index'

  resources :tasks, only: [ :index, :new, :create, :destroy ]
end
