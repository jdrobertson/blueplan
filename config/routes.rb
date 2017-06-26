Rails.application.routes.draw do
  get 'sessions/new'

  root 'homes#show'
  resource :home
  resource :session
  resources :users
  resources :songs
  resources :events do
    resources :scheduled_songs
  end

end
