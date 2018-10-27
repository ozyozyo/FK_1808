Rails.application.routes.draw do
  devise_for :users
  root "static_pages#index"
  resources :schedules, only: [:create]
  get "/events", to: "schedules#events"
end
