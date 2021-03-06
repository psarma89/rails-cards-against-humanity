Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :cards, only: [:index]
      resources :rooms, only: [:index, :show]
      post '/joinroom' => 'rooms#joinroom'
      post '/signup' => 'users#create'
      # post '/users' => 'users#create'
      post '/login' => 'auth#create'
      get '/current_user' => 'auth#show'


    end
  end
end
