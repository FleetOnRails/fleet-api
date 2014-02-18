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
    #
    # Me
    #

    get '/me' => 'me#index'
    patch '/me' => 'me#update'

    #
    # Users
    #

    resources :users
  end
end
