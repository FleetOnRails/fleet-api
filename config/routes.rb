FleetOnRails::Application.routes.draw do
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

    resources :users, only: [:index, :show, :create]
    resources :groups, only: [:index, :show, :create, :update, :destroy]
  end
end
