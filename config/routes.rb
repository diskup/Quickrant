Rails.application.routes.draw do
  devise_for :admin, skip:[:regstrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    get 'search' => 'searches#search', as: 'search'
    resources :shops,  only:[:index, :show, :edit, :update]
    resources :fix_requests, only:[:index, :show, :edit, :update]
  end

  root to: 'user/homes#top'
  devise_for :users, skip:[:passwords], controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }
  scope module: :user do
    get 'search' => 'searches#search', as: 'search'
    resources :shops, except: [:destroy] do
      get 'confirm' => 'shops#confirm'
      resources :images, only: [:new, :create, :destroy] do
        post 'image_favorites' => 'image_favorites#create', as: 'favorites'
        delete 'image_favorites' => 'image_favorites#destroy', as: 'favorite'
      end
      post 'shop_favorites' => 'shop_favorites#create', as: 'favorites'
      delete 'shop_favorites' => 'shop_favorites#destroy', as: 'favorite'
      resources :reviews, only: [:new, :create, :destroy]
      resources :fix_requests, only: [:new, :create]
    end
    resources :timeline, except: [:edit, :update] do
      post 'timeline_favorites' => 'timeline_favorites#create', as: 'favorites'
      delete 'timeline_favorites' => 'timeline_favorites#destroy', as: 'favorite'

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