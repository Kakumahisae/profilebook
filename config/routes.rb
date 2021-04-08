Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/help'
  
  resources :stories
  resources :users
end
