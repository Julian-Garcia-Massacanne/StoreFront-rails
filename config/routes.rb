Rails.application.routes.draw do
  devise_for :users

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker


  # Ruta default
  root to: "home#index"


  resources :products, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

  resources :users , only: [:index, :new]

  post '/user_register', to: 'users#create'
  post '/user_block', to: 'users#block'

  get '/profile', to: 'users#edit', as: :edit_profile
  patch '/profile', to: 'users#update'


  resources :sales , only: [:index, :new, :create]

  patch '/sales/:id/cancel', to: 'sales#cancel', as: 'cancel_sale'

  resources :clients, only: [:new, :create]

end
