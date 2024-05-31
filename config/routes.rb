Rails.application.routes.draw do
  resources :applicants
  root 'home#index'
  resources :positions
  resources :companies
  devise_for :users

end
