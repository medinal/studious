Rails.application.routes.draw do

  root to: "home#index"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {registrations: 'user/registrations', sessions: 'user/sessions'}

  resources :portfolios, param: :portfolio_id, only: [:show]

  resource :student, only: [:show] do
    resource :profile
    resource :image
    resources :projects do
      resources :images, except: [:index, :show]
    end
    resources :portfolios, param: :portfolio_id do
      get :autocomplete_institution_name, :on => :collection
    end
  end

  resource :processor, only: [:show] do
    resources :institutionportfolios, :path => 'portfolios'
  end

  get "student/portfolios/:portfolio_id/share", to: "portfolios#share", as: "share"
  post "student/portfolios/:portfolio_id/submit", to: "portfolios#submit", as: "submit"


end
