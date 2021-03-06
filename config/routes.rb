Rails.application.routes.draw do

  #Superuser routes
  mount RailsAdmin::Engine => '/superuser', as: 'rails_admin'

  #Session Routes
  devise_for :users, controllers: {registrations: 'user/registrations', sessions: 'user/sessions'}

  #Public Routes
  root to: "home#index"
  get "portfolios/:portfolio_id", to: "portfolios#showpublic"

  #Student Routes
  resource :student, only: [:show] do
    resource :profile
    resource :image
    resources :projects do
      resources :images, except: [:index, :show]
    end
    resources :portfolios, param: :portfolio_id
    #For searching
    resources :institutionportfolios, only: [:destroy] do
      get :autocomplete_institution_name, :on => :collection
    end
  end
  get "student/portfolios/:portfolio_id/share", to: "institutionportfolios#new", as: "share"
  post "student/portfolios/:portfolio_id/submit", to: "institutionportfolios#create", as: "submit"

  #Processor Routes
  resource :processor, only: [:show] do
    resource :image
    resources :institutionportfolios, :path => 'portfolios', except: [:new, :create, :destroy]
  end

  #Admin Routes
  resources :admins do
    resource :image
  end

  match "*path", to: "application#redirect", via: :all, as: "redirect"


end
