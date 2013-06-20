GiveInspireLove::Application.routes.draw do
  
  
  scope '/api/v1', :namespace => :api do
    resource :causes
  end

  match "/profiles/edit" => "profiles#edit"
  match "/profiles/follow_cause/:id" => "profiles#follow_cause"
  resources :profiles

  match "/causes/need/:id" => "causes#need"

  resources :causes
  resources :donations
  resources :volunteers
  resources :cause_applications
  resources :donations_needs
  resources :good_needs
  resources :social_needs
  resources :volunteer_needs



  root :to => "pages#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

end
