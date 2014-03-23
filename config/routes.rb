FleetOnRails::Application.routes.draw do
  devise_for :users

  use_doorkeeper do
    controllers :applications => 'oauth/custom_applications'
    controllers :tokens => 'oauth/custom_tokens'
    skip_controllers :authorizations, :authorized_applications
  end

  namespace :v1 do
    get '/me', to: 'me#index'
    put '/me', to: 'me#update'

    resources :users, only: [:index, :show, :create, :update, :destroy]

    resources :cars, only: [:index, :show, :create, :update, :destroy] do
      resources :service_records, only: [:index, :show, :create, :update, :destroy]
      resources :documents, only: [:index, :show, :create, :update, :destroy]
      resources :diagnostic_faults, only: [:index, :show, :create, :update]
      resources :diagnostic_statistics, only: [:index, :show, :create]
      resources :gps_statistics, only: [:index, :show, :create]
      resources :fuel_entries, only: [:index, :show, :create, :update, :destroy]
    end

    resources :service_records, only: [] do
      resources :documents, only: [:index, :show, :create, :update, :destroy]
    end

    resources :vendors, only: [:index, :show, :update, :create, :destroy] do
      resources :products, only: [:index, :show, :update, :create, :destroy]
    end

    resources :groups, only: [:index, :show, :create, :update, :destroy] do
      resources :users, only: [:index, :create, :destroy]
      resources :cars, only: [:index, :show, :update, :create, :destroy]
      resources :vendors, only: [:index, :show, :update, :create, :destroy]
      resources :destinations, only: [:index, :show, :update, :create, :destroy]
    end
  end
end
