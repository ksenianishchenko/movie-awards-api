Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  get '/nominates/:id', to: 'movies#find_nominates'

  resources :users, only: [:create, :show, :index]
  resources :movies, only: [:create, :show, :index, :destroy]
end
