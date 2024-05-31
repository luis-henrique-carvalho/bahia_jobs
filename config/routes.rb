Rails.application.routes.draw do
  resources :applicants
  resources :positions
  resources :companies
  root 'positions#index'
  devise_for :users

end
