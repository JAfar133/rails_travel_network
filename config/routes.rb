Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :travel_places
  root 'travel_places#index'
  get "up" => "rails/health#show", as: :rails_health_check
  get '/error', to: 'errors#error', as: :error
  get '*unmatched_route', to: 'application#render_not_found', via: :all
  
end
