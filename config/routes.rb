Rails.application.routes.draw do

  root to: "home#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {registrations: 'user/registrations'}

  resource :student, only: [:show] do
    resource :profile
    resources :projects
  end

  resources :users, only: [:index] do
    resource :profile, only: [:show]
    resources :projects, only: [:index, :show]
  end
  
end
