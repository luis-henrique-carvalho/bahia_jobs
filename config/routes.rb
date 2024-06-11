Rails.application.routes.draw do
  resources :resumes
  root 'positions#index'
  devise_for :users

  resources :applicants
  resources :positions
  resources :companies do
    resources :positions, only: [:index], controller: 'companies_positions'
  end
end
