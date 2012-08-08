DualtRails3BootstrapDeviseCancan::Application.routes.draw do
  root :to => "home#index"
  
  devise_for :users
  resources :users,     :only => [:show, :index]
  resources :bilan,     :only => [:show, :index, :update]
  resources :comments,  :only => [:create, :destroy]

  namespace :admin do 
    get '', to: 'dashboard#index', as: '/'
    resources :eleves, :as => "students"
    resources :contexts
    resources :classes, :as => "classrooms"
    resources :competences 
    resources :capacites
  end

  
  
  
end
