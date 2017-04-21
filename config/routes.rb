Rails.application.routes.draw do
  root 'demo_wuphfs#new'

  get 'dashboard'                 => 'dashboard#home'
  get 'dashboard/twitter_enabled' => 'dashboard#twitter_enabled'
  get 'dashboard/twitter_auth'    => 'dashboard#twitter_auth'

  # Devise - Removes ability to remove account
  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end

  # Resource Routes
  resources :demo_wuphfs
  resources :recipients
  resources :messages
end
