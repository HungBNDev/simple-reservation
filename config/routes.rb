Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "reservations#new"
  resources :reservations, only: [:new, :create, :index]

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'user/registrations'
      }
      devise_for :clients, controllers: {
        sessions: 'api/v1/clients/sessions',
        registrations: 'client/registrations'
      }
      # post 'login', to: 'sessions#create'
      # delete 'logout', to: 'sessions#destroy'

      resources :brands
      resources :products
      resources :clients
      namespace :clients do
        resources :cards, only: [:create]
      end
    end
  end
end
