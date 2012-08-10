class HomeController < ApplicationController
  def index
    
    if current_user
      case current_user.role
           when 'teacher', 'admin'
             redirect_to admin_url
           when 'student'
             redirect_to bilan_index_url
         end
    end

    
         @teachers = User.teachers
         @students = User.students
         @admins = User.admins
       
    
    
  end
end
