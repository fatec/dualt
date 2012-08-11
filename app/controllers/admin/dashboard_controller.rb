class Admin::DashboardController < ApplicationController
before_filter :authenticate_user!
#Cancan reserver l'accès aux :admin et :teacher

  def index
      if current_user
        case current_user.role
             when 'teacher'
               
             when 'student'
               redirect_to root_url
           end
      else
        redirect_to new_user_session_url
      end
      
      
  end
end
