Rails.application.routes.draw do
  root 'public#index'
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    registrations: 'admins/registrations'
  }
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
    end
  end
  scope module: :public do
    get '/about'  => 'public#about'
    resources :posts, only: [:index, :show]
  end
  authenticate :user do
    namespace :user do
      resource :user_profile, path: :profile, only: [:create, :edit, :update]
      resources :posts, except: :show do
        resources :favorites, only: [:create, :destroy]
        resources :post_comments, only: [:create, :destroy]
      end
    end
  end
end
