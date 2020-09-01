Rails.application.routes.draw do
  resources :events
  resources :users, only: %i[show new create]
  get 'login' => 'users#login'
  post 'login' => 'users#auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
