# spec/controllers/admin/dashboard_controller_spec.rb
require 'spec_helper'

describe Admin::DashboardController do

  describe 'user access' do

    describe "GET 'index'" do      
      it "returns http success" do
        teacher = FactoryGirl.create(:teacher)
        sign_in teacher
        get :index
        response.should be_success
      end
    end
  end

  describe "GET 'index'" do
    it "redirects non-user to the login form" do
      get :index
      response.should redirect_to new_user_session_url
    end
    
    it "redirects student to the root_url" do
      student = FactoryGirl.create(:student)
      sign_in student
      get :index
      
      response.should redirect_to root_url
    end
  end
  
end