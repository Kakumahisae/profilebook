Rails.application.routes.draw do
  
  root 'homes#top'
  get 'homes/help'
  
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  
  
  resources :users
  resources :stories do
    resources :characters
  end
end
