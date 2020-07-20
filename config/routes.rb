Rails.application.routes.draw do
  # devise_for :, controllers: {
  #   sessions:      'admins/sessions'
  # }
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in'    => 'admins/sessions#new', as: :new_admin_session
    post 'admins/sign_in'    => 'admins/sessions#create', as: :admin_session
    delete 'admins/sign_out' => 'asmins/sessions#destroy',  as: :destroy_admin_session
  end
  devise_for :users, controllers: {
    sessions:           'users/sessions',
    registrations:      'users/registrations',
    passwords:          'users/passwords',
    confirmations:      'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  authenticate :admin do
    namespace :admin do
      resources :categories
      resources :tags
      resources :posts, only: [:index, :show] do
        resources :approvals, only: [:update]
      end
      resources :users, only: [:index, :show]
    end
  end
  root 'public#index'
  get '/about'  => 'public#about'
  get '/privary_policy'  => 'public#privary_policy'
  get '/terms'  => 'public#terms'
  scope module: :public do
    resources :contacts, only: [:new]
    resources :posts, only: [:index, :show]
    resources :users, only: :show
  end
  authenticate :user do
    namespace :user do
      resource :user_profile, path: :profile, only: [:edit, :update]
      resources :posts, except: :show do
        resources :favorites, only: [:create, :destroy]
        resources :post_comments, only: [:create, :destroy]
      end
    end
  end
end
