require 'spec_helper'

describe Context do
  
  
  describe "Factory" do
    context "with valid attributes" do
      it "has a valid factory" do
        FactoryGirl.build(:context).should be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid without a teacher" do
        FactoryGirl.build(:context, :teacher_id => nil).should_not be_valid
      end
  
      it "is invalid without a classroom" do
        FactoryGirl.build(:context, :classroom_id => nil).should_not be_valid
      end
  
      it "is invalid without a competence" do
        FactoryGirl.build(:context, :competence_id => nil).should_not be_valid
      end
    end
  end
  
end
