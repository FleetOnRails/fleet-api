FleetApi::Application.routes.draw do
  use_doorkeeper

  #
  # Help
  #
  get ''                    => 'help#index'
  get 'help/api'            => 'api_docs#index'
  get 'help/api/:category'  => 'api_docs#show', as: 'help_api_file'

  #
  # API
  #
  namespace :api do
    namespace :v1 do
      resources :me, only: [:index]
      resources :users
    end
  end
end
