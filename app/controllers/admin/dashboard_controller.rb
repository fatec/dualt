class Admin::DashboardController < ApplicationController
before_filter :authenticate_user!
#Cancan reserver l'accès aux :admin et :teacher

  def index
    
    
    if current_user
      if current_user.has_role? :admin
        return
      elsif current_user.has_role? :teacher
        return
      elsif current_user.has_role? :student
        redirect_to root_url
      end
    else
      redirect_to new_user_session_url
    end
    
 
      
      
  end
end
