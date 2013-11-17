Pideya::Application.routes.draw do

  resources :venues

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  get "get_venues" => "venues#get_venues", format: :json
  root :to => 'home#index'

end
