GiveInspireLove::Application.routes.draw do

  match "/specs/javascripts", :to => "test_runner#index"

  match "/profiles/edit" => "profiles#edit"
  match "/profiles/follow_cause/:id" => "profiles#follow_cause"

  match '/page/:action' => 'StaticPages'

  resources :profiles

  match "/causes/need/:id" => "causes#need"

  resources :causes
  resources :donations
  resources :volunteers
  resources :cause_applications
  resources :needs

  root :to => "pages#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  match "/smooth/meta_data" => Smooth::MetaData::Application, :anchor => false

  get "/api/v1/:resource", :to => "presentables#index", :format => :json, :presenter_format => :default
  get "/api/v1/:resource/:presenter_format", :to => "presentables#index", :format => :json
end
