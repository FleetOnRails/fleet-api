FleetApi::Application.routes.draw do
  apipie
  use_doorkeeper


  #
  # Help
  #
  get 'help'                => 'help#index'
  get 'help/api'            => 'help#api'
  get 'help/api/:category'  => 'help#api', as: 'help_api_file'

  #
  # API
  #
  namespace :api do
    namespace :v1 do
      resources :me

      get '/users', to: 'user#index'
      get '/users/:id', to: 'user#show'
      post '/users', to: 'user#create'
    end
  end
end
