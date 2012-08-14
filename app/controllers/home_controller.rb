class HomeController < ApplicationController
  def index
   # flash.keep

    if current_user 
      if current_user.has_role? :teacher
        redirect_to admin_url
      elsif current_user.has_role? :admin
        redirect_to admin_url
      elsif current_user.has_role? :student
        redirect_to bilan_index_url
      end
    end
    
     @teachers = User.with_role :teacher
     @students = User.with_role :student
     @admins = User.with_role   :admin

  end
end
