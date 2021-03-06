Rails.application.routes.draw do
  post '/signup' => 'splash#signup', as: :splash_signup
  get '/splash' => 'splash#index'
  root 'splash#index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations',  }
  get '/setup/open' => 'setup#open'
  post '/setup/generate' => 'setup#generate'
  get '/setup' => 'setup#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shot_setups
  resources :accounts
  resources :spins do
    resources :shots
  end
end
