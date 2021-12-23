Rails.application.routes.draw do
  # ↓管理者
  devise_for :admin, skip:[:regstrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    get 'search' => 'searches#search', as: 'search'
    resources :shops,  only:[:index, :show, :edit, :update]
  end
  # ↓ユーザー
  root to: 'user/homes#top'
  devise_for :users, skip:[:passwords], controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }
  scope module: :user do
    get 'search' => 'searches#search', as: 'search'
    resources :shops, except: [:destroy] do
      post 'confirm' => 'shops#confirm'
      get 'complete' => 'shops#complete'
      resources :images, only: [:new, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :reviews, only: [:new, :index, :create, :destroy]
    end

    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'users#followings'
      get 'followeds' => 'users#followeds'
    end
  end
end