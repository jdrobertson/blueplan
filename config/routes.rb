Rails.application.routes.draw do
  root 'homes#show'
  resource :home
  resources :songs
  resources :events
end
