GiveInspireLove::Application.routes.draw do

  match "/specs/javascripts", :to => "test_runner#index"

  match "/profiles/edit" => "profiles#edit"

  match '/page/:action' => 'StaticPages'

  match '/modals/:action(/:id)' => 'Modals'

  #match '/api/profiles/:action' => 'Api::Profiles#:action'

  resources :profiles

  # Look, SEO / Human Readable URLs
  get "/charities-in-:city_slug", :to => "city_hubs#show"
  get "/charities-in-:city_slug/supporting-:by_cause_type", :to => "city_hubs#show"
  get "/charities-supporting-:by_cause_type", :to => "category_hubs#show"
  get "/charities-supporting-:cause_type_slug/in-:city_slug", :to => "category_hubs#show"

  get '/cities', :to => 'cities#show'

  resources :causes
  resources :cause_applications
  resources :subscribers

  resources :volunteer_needs, :controller => "Needs"
  resources :cash_donation_needs, :controller => "Needs"
  resources :goods_donation_needs, :controller => "Needs"
  resources :follower_needs, :controller => "Needs"
  resources :promotion_needs, :controller => "Needs"

  match "/causes/:cause_slug/edit/:action" => "CausePortal#:action"


  get "/causes/new_fullfilment/:need_id", :to => "Fulfillments#new"
  #get "/causes/:cause_slug/:need_id/new", :to => "needs#new"
  post "/causes/:need_id/fulfillments", :to => "Fulfillments#create"
  post "/causes/:cause_slug/followers", :to => "followers#create"
  delete "/causes/:cause_slug/followers", :to => "followers#destroy"

  root :to => "pages#index"

  match '/profiles/:id', :to => 'profiles#show', :as => :user
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users


  match "/smooth/meta_data" => Smooth::MetaData::Application, :anchor => false

  namespace :api do
    match 'profiles/:action', :to => "Profiles#:action"
    match 'contributions/:action', :to => "Contributions#:action"
  end



  get "/api/v1/:resource", :to => "presentables#index", :format => :json, :presenter_format => :default
  get "/api/v1/:resource/:presenter_format", :to => "presentables#index", :format => :json


  get "/users/me.json", :to => "users#show", :format => :json

  match "/user_event", :to => Unite::Events::TrackingEndpoint.new
end
