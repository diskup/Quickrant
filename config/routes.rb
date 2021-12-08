Rails.application.routes.draw do
  devise_for :admin, skip:[:regstrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, skip:[:passwords], controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
end