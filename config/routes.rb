Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update]
  get "/homes/about" => "homes#about", as: "about"
  patch 'users/:id' => 'users#update', as: 'update_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
