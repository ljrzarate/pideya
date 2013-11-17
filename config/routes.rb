Pideya::Application.routes.draw do

  resources :venues

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  get "get_venues" => "venues#get_venues", format: :json

  root :to => 'home#index'

end
