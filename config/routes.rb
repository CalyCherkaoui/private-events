Rails.application.routes.draw do
  resources :events
  resources :users, only: %i[show new create index]
  get 'login' => 'users#login'
  get 'logout' => 'users#logout'
  get 'signup' => 'users#new'
  post 'signup' => 'user#create'
  post 'login' => 'users#auth'
  post 'attend' => 'events#attend'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
