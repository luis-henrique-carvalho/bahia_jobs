Rails.application.routes.draw do
  resources :applicants
  resources :positions
  resources :companies
  root 'home#index'
  devise_for :users

end
