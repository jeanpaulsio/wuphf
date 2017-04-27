Rails.application.routes.draw do
  root 'demo_wuphfs#new'

  get 'dashboard'                 => 'dashboard#home'
  get 'dashboard/twitter_enabled' => 'dashboard#twitter_enabled'
  get 'dashboard/twitter_auth'    => 'dashboard#twitter_auth'
  get 'dashboard/twitter_unlink'  => 'dashboard#twitter_unlink'
  get 'investors'                 => 'pages#investors'

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

  # API Routes
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', :controllers => { registrations: 'users/registrations' }
      resources :recipients
      resources :messages, only: [:create]

      get "/404" => "errors#not_found"
      get "/500" => "errors#exception"
    end
  end
end
