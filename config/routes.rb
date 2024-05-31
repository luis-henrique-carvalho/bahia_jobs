Rails.application.routes.draw do
  resources :companies
  resources :positions
  resources :applicants
  root 'home#index'
  devise_for :users

end
