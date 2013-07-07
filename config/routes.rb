GiveInspireLove::Application.routes.draw do

  match "/specs/javascripts", :to => "test_runner#index"

  match "/profiles/edit" => "profiles#edit"

  match '/page/:action' => 'StaticPages'



  resources :profiles

  # Look, SEO / Human Readable URLs
  get "/charities-in-:city_slug", :to => "city_hubs#show"
  get "/charities-in-:city_slug/supporting-:by_cause_type", :to => "city_hubs#show"
  get "/charities-supporting-:by_cause_type", :to => "category_hubs#show"
  get "/charities-supporting-:cause_type_slug/in-:city_slug", :to => "category_hubs#show"

  resources :causes
  resources :donations
  resources :volunteers
  resources :cause_applications
  resources :needs

  post "/causes/:cause_slug/followers", :to => "followers#create"
  delete "/causes/:cause_slug/followers", :to => "followers#destroy"

  root :to => "pages#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  match "/smooth/meta_data" => Smooth::MetaData::Application, :anchor => false

  get "/api/v1/:resource", :to => "presentables#index", :format => :json, :presenter_format => :default
  get "/api/v1/:resource/:presenter_format", :to => "presentables#index", :format => :json

  get "/users/me.json", :to => "users#show", :format => :json
end
