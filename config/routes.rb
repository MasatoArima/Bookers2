Rails.application.routes.draw do
  get 'users/show'
  get 'homes/about'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:create, :index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
