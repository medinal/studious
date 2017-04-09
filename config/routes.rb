Rails.application.routes.draw do

  root to: "home#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {registrations: 'user/registrations', sessions: 'user/sessions'}

  resources :portfolios, param: :portfolio_id, only: [:show]

  resource :student, only: [:show] do
    resource :profile
    resources :projects
    resources :portfolios, param: :portfolio_id
  end

  get "student/portfolios/:portfolio_id/submit", to: "portfolios#submit", as: "submit"

end
