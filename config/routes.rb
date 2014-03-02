FleetOnRails::Application.routes.draw do
  get "fuel_entries/index"
  get "fuel_entries/show"
  get "fuel_entries/create"
  get "fuel_entries/update"
  get "fuel_entries/destroy"
  use_doorkeeper

  #
  # Help
  #
  get '/' => 'help#index'
  get '/api' => 'api_docs#index'
  get '/api/:category' => 'api_docs#index', as: 'help_api_file'

  #
  # API
  #
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
      resources :fuel_entries, only: [:index, :show, :create]
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
