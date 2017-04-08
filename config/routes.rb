Rails.application.routes.draw do

  root to: "home#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {registrations: 'user/registrations'}

  resources :portfolios, only: [:show]

  resource :student, only: [:show] do
    resource :profile
    resources :projects
    resources :portfolios
  end

  get "/student/submit", to: "students#submit", as: "submit"

end
