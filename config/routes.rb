Rails.application.routes.draw do
  get 'users/show'
  get 'homes/about'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:edit, :create, :index, :show, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
