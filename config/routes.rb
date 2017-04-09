Rails.application.routes.draw do

  root to: "home#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {registrations: 'user/registrations'}

  resources :users, only: [:show] do
    resource :profile, only: [:show]
    resources :projects, only: [:index, :show]
  end

  resource :student, only: [:show] do
    resource :profile
    resources :projects
  end

  get "/student/submit", to: "students#submit", as: "submit"

end
