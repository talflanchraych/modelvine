FiscalFitness::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  # resources gives :users all RESTful routes
  resources :users do
    resources :models, :photographers, :agencies, :businesses, :makeup_artists
    member do
      post :set_default_photo
    end
    collection do
      post :search
      get :invite
      post :generate_invites
    end
  end

  resources :models, :photographers, :agencies, :businesses, :makeup_artists
  
  match '/manage_photos', to: 'users#manage_photos', via: 'get'

  # resources :sessions, only: [:new, :create, :destroy] 
  resources :user_photos

  root 'static_pages#home', via: 'get'

  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/jobs',   to: 'static_pages#jobs',   via: 'get'
  match '/developer',to: 'static_pages#developer', via: 'get'
  match '/waitlist', to: 'static_pages#waitlist', via: 'get'
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'

end
