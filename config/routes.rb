Rails.application.routes.draw do
  root 'travel_places#index'
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  
  resources :travel_places do
    member do
      post 'add_to_favorites'
    end
  end

  resources :users, only: [] do
    get 'favorites', on: :member
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
