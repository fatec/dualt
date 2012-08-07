DualtRails3BootstrapDeviseCancan::Application.routes.draw do
  root :to => "home#index"
  
  devise_for :users
  resources :users,     :only => [:show, :index]
  resources :bilan,     :only => [:show, :index, :update]
  resources :comments,  :only => [:create]

  namespace :admin do 
    get '', to: 'dashboard#index', as: '/'
    resources :eleves, :as => "students"
    resources :contextes, :as => "contexts"
    resources :classes
    resources :competences 
    resources :capacites
  end

  
  
  
end
