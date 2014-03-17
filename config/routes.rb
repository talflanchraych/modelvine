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

  # Home Page
  root  'static_pages#home' 

  # Match URL with controller action. Specify specifically
  # match '/signup',  to: 'users#new',            via: 'get'
  # match '/signin',  to: 'sessions#new',         via: 'get'
  # match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/jobs',   to: 'static_pages#jobs',   via: 'get'
  match '/developer',to: 'static_pages#developer', via: 'get'
  match '/waitlist', to: 'static_pages#waitlist', via: 'get'
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
