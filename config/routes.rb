Rails.application.routes.draw do
  root "static_pages#index"
  resources :schedules, only: [:create]
  get "/events", to: "schedules#events"
end
