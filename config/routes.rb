Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies
  resources :lists, only: %i[show new create] do
    resources :bookmarks, only: %i[new create]
  end

  # Defines the root path route ("/")
  root 'movies#index'
end
