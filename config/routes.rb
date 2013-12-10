FleetApi::Application.routes.draw do
  namespace :v1 do
    resources :user
  end
end
