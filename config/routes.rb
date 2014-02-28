FleetOnRails::Application.routes.draw do
  get "gps_statistics/index"
  get "gps_statistics/show"
  get "gps_statistics/create"
  get "gps_statistics/update"
  get "gps_statistics/destroy"
  get "documents/index"
  get "documents/show"
  get "documents/create"
  get "documents/update"
  get "documents/delete"
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
      resources :documents, only: [:index, :show, :create, :update, :destroy]
      resources :diagnostic_faults, only: [:index, :show, :create, :update]
      resources :diagnostic_statistics, only: [:index, :show, :create]
      resources :gps_statistics, only: [:index, :show, :create]
    end

    resources :groups, only: [:index, :show, :create, :update, :destroy] do
      resources :users, only: [:index, :create, :destroy]
      resources :cars, only: [:index, :show, :update, :create, :destroy]
      resources :destinations, only: [:index, :show, :update, :create, :destroy]
    end
  end
end
