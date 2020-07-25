Rails.application.routes.draw do
  resources :users
  resources :moderators
  resource :session, only: [:new, :create, :destroy]
end
