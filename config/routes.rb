FleetApi::Application.routes.draw do
  apipie

  namespace :api_docs do
    namespace :v1 do
      get '/users', to: 'user#index'
      get '/users/:id', to: 'user#show'
      post '/users', to: 'user#create'
    end
  end
end
