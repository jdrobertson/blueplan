Rails.application.routes.draw do
  get 'users/new'

  root 'homes#show'
  resource :home
  resources :users
  resources :songs
  resources :events do
    resources :scheduled_songs
  end
end
