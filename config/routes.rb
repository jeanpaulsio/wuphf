Rails.application.routes.draw do
  root 'demo_wuphfs#new'

  get 'dashboard'                 => 'dashboard#home'
  get 'dashboard/twitter_enabled' => 'dashboard#twitter_enabled'
  get 'dashboard/twitter_auth'    => 'dashboard#twitter_auth'

  # Devise
  devise_for :users

  # Resource Routes
  resources :demo_wuphfs
  resources :recipients
end
