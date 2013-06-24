GiveInspireLove::Application.routes.draw do

  match "/profiles/edit" => "profiles#edit"
  match "/profiles/follow_cause/:id" => "profiles#follow_cause"

  resources :profiles

  match "/causes/need/:id" => "causes#need"

  resources :causes
  resources :donations
  resources :volunteers
  resources :cause_applications

  root :to => "pages#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get "/api/v1/:resource/:presenter_format", :to => "presentables#index"
end
