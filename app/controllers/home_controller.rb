class HomeController < ApplicationController
  def index
    @teachers = User.teachers
    @students = User.students
  end
end
