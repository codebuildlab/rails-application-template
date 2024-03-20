Rails.application.routes.draw do
  devise_for :users, :path => "auth", controllers: {
    sessions: 'auth/sessions',
    confirmations: 'auth/confirmations',
    passwords: 'auth/passwords',
    registrations: 'auth/registrations',
    unlocks: 'auth/unlocks',
    omniauth: 'auth/omniauth',
  }
  
  devise_scope :user do
    # Extra methods for user 
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  if Rails.env.development?
    require 'sidekiq/web'        
    mount Sidekiq::Web => '/sidekiq'
  end
end
