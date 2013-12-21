FleetApi::Application.routes.draw do
  use_doorkeeper
  apipie

  namespace :api do
    namespace :v1 do
      get '/users', to: 'user#index'
      get '/users/:id', to: 'user#show'
      post '/users', to: 'user#create'
    end
  end
end
