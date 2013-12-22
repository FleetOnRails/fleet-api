FleetApi::Application.routes.draw do
  apipie
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      resources :me

      get '/users', to: 'user#index'
      get '/users/:id', to: 'user#show'
      post '/users', to: 'user#create'
    end
  end
end
