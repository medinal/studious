Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user/registrations'}

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index] do
    resource :profile, only: [:index]
    resources :project, only: [:index, :show]
  end

  resource :student, only: [:show] do
    resource :profile
    resources :project
  end

end
