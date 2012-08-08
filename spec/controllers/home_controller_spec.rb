require 'spec_helper'

describe HomeController do

  it "redirects teachers to administration" do
    teacher = FactoryGirl.create(:user, :role => "teacher")
    sign_in teacher
    get :index
    response.should redirect_to admin_url
  end
  
  it "redirects students to bilan" do
    student = FactoryGirl.create(:user, :role => "student")
    sign_in student
    get :index
    response.should redirect_to bilan_index_url
  end

  describe "user is not admin or student" do    
  end



end
