require 'spec_helper'

describe Note do
  context "with valid attributes" do
    it "has a valid factory" do
      FactoryGirl.build(:note).should be_valid
    end
  end
  
  
  context "with invalid attributes" do
    it "is invalid with a note higher than 3" do
      FactoryGirl.build(:note, :note_eleve => 4).should_not be_valid
    end
    
    it "is invalid with no context" do
      FactoryGirl.build(:note, :context_id => nil).should_not be_valid
    end
  
    it "is invalid with no student" do
      FactoryGirl.build(:note, :student_id => nil).should_not be_valid
    end
  end
end
