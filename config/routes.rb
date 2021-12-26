Rails.application.routes.draw do
  # ↓管理者
  devise_for :admin, skip:[:regstrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    resources :shops,  only:[:index, :show, :edit, :update, :destroy]
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
      get 'complete' => 'shops#complete'
      resources :images, only: [:new, :create, :destroy, :index]
      resource :favorites, only: [:create, :destroy]
      resources :reviews, only: [:new, :index, :create, :destroy]
    end

    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followeds, on: :member
      get :favorites, on: :member
      get :reviews, on: :member
      get :shops, on: :member
    end
  end
end