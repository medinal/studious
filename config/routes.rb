Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'user/registrations'}

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "home#index"

  resources :users, only: [:index] do
    resource :profile, only: [:show]
    resources :projects, only: [:index, :show]
  end

  resource :student, only: [:show] do
    resource :profile
    resources :projects
  end

end
