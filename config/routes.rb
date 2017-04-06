Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user/registrations'}

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index] do
    resource :profile, except: [:index]
    resources :project
  end

  get "/student/dashboard", to: "users#index"
  get "/student/profile", to: "profile#show", as: "profile"
  get "/student/projects", to: "projects#index", as: "projects"
  get "/student/projects/:id", to: "projects#show", as: "project"

end
