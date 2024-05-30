Rails.application.routes.draw do
  root 'home#index'
  resources :applicants
  resources :positions
  resources :companies
  devise_for :users

end
