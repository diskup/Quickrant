Rails.application.routes.draw do

  root to: 'user/homes#top'
  devise_for :users, skip:[:passwords], controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }
  scope module: :user do
    get 'search' => 'searches#search', as: 'search'
    resources :shops, except: [:destroy] do
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