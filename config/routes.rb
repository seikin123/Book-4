Rails.application.routes.draw do

  devise_for :users
  resources :users
  root to: 'homes#index'
  get "/home/about" => "homes#about"
  

end
