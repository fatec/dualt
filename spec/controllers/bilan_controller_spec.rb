require 'spec_helper'

describe BilanController do

  describe "GET 'index'" do
    
    it "redirects teachers to administration" do
      teacher = FactoryGirl.create(:teacher)
      sign_in teacher
      get :index
      response.should redirect_to admin_contexts_url
    end
    
    it "renders the index template to students" do
      student = FactoryGirl.create(:student)
      sign_in student
      get :index
      response.should render_template :index
    end
    
    
    describe "user is not admin or student" do    
      it "redirects to root_url if not admin or student" do
        no_role = FactoryGirl.create(:user_no_role)
        sign_in no_role
        get :index
        response.should redirect_to root_url
      end
    
      it "redirects to root_url if not admin or student" do
        nil_role = FactoryGirl.create(:user_nil_role)
        sign_in nil_role
        get :index
        response.should redirect_to root_url
      end
    end
    
  end

  describe "GET 'show'" do
    
    it "redirects admins to admin_eleve_show(id)" do
      teacher = FactoryGirl.create(:teacher)
      sign_in teacher
      get :show, id: FactoryGirl.create(:context)
      response.should redirect_to root_url
    end
    
    describe "user is not admin or student" do    
      it "redirects to root_url if not admin or student" do
        no_role = FactoryGirl.create(:user_no_role)
        sign_in no_role
        get :show, id: FactoryGirl.create(:context)
        response.should redirect_to root_url
      end
    
      it "redirects to root_url if not admin or student" do
        nil_role = FactoryGirl.create(:user_nil_role)
        sign_in nil_role
        get :show, id: FactoryGirl.create(:context).id
        response.should redirect_to root_url
      end
    end
    
    it "assigns the requested context to @context if student is logged in" do
      student = FactoryGirl.create(:student)
      sign_in student
      classroom = FactoryGirl.create(:classroom)
      inscription = FactoryGirl.create(:inscription, :student_id => student.id, :classroom_id => classroom.id)
      context = FactoryGirl.create(:context, :classroom_id => classroom.id)
      get :show, id: context
      assigns(:context).should eq(context)
    end
    
    it "renders the :show template for students"do
      student = FactoryGirl.create(:student)
      sign_in student  
      classroom = FactoryGirl.create(:classroom)
      inscription = FactoryGirl.create(:inscription, :student_id => student.id, :classroom_id => classroom.id)
      context = FactoryGirl.create(:context, :classroom_id => classroom.id)
      get :show, id: context
      response.should render_template :show
    end
    
    it "fails if the context does not belongs to the student classroom" do
      student = FactoryGirl.create(:student)
      sign_in student
      classroom = FactoryGirl.create(:classroom)
      inscription = FactoryGirl.create(:inscription, :student_id => student.id, :classroom_id => classroom.id)
      context = FactoryGirl.create(:context, :classroom_id => classroom.id+2)
#      context.classroom_id is in student.classrooms
      get :show, id: context
      response.should redirect_to bilan_index_url
    end
    
  end

end
