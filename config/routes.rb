Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users', to: 'user/dashboard#index'

  namespace :user do
    resources :dashboard, only: [:index]
  end

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/friendships', to: 'friendships#create'

  get '/discover', to: 'discover#index'

  get '/movies', to: 'movies#index'
  post '/movies', to: 'movies#search'
  get '/movie/show', to: 'movies#show'

  get '/movie_party/new', to: 'movie_parties#new'
  post '/movie_party/new', to: 'movie_parties#create'
end
