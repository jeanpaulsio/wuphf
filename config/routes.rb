Rails.application.routes.draw do
  root 'demo_wuphfs#new'

  get 'dashboard' => 'recipients#index'

  # Devise
  devise_for :users

  # Resource Routes
  resources :demo_wuphfs
  resources :recipients
end
