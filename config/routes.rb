Rails.application.routes.draw do
  resources :resumes
  root 'positions#index'
  devise_for :users

  resources :applicants
  resources :positions do
    resources :applicants, only: [:index], controller: 'positions_applicants'
  end
  resources :companies do
    resources :positions, only: [:index], controller: 'companies_positions'
  end
end
