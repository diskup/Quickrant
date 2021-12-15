Rails.application.routes.draw do
  # ↓管理者
  devise_for :admin, skip:[:regstrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    get 'search' => 'searches#search', as: 'search'
    resources :shops,  only:[:index, :show, :edit, :update]
    resources :fix_requests, only:[:index, :show, :edit, :update]
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
      post 'shop_favorites' => 'shop_favorites#create', as: 'favorites'
      delete 'shop_favorites/:id' => 'shop_favorites#destroy', as: 'favorite'
      resources :reviews, only: [:new, :index, :create, :destroy]
      resources :fix_requests, only: [:new, :create]
    end
    resources :timeline, except: [:edit, :update] do
      post 'timeline_favorites' => 'timeline_favorites#create', as: 'favorites'
      delete 'timeline_favorites/:id' => 'timeline_favorites#destroy', as: 'favorite'

    end
    resources :schedules, only: [:index, :create, :update, :destroy]
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'users#followings'
      get 'followeds' => 'users#followeds'
      get 'unsubscribe' => 'users#unsubscribe'
      get 'withdraw' => 'users#/withdraw'
    end
  end
end