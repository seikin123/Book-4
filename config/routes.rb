Rails.application.routes.draw do

  root to: 'homes#index'
  get "/home/about" => "homes#about"
  
  devise_for :users
  resources :users
  resources :books
  

end
