Rails.application.routes.draw do
  resources :urls, only: [ :index, :new, :create, :show ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "urls#new"

  get '/s/:slug', to: 'urls#redirect'

  get '/urls/:slug/stats', to: 'clicks#stats'
end
