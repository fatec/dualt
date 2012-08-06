require 'spec_helper'

describe Competence do
  it "has a valid factory" do
    FactoryGirl.create(:competence).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:competence, name: nil).should_not be_valid
  end  
  
  
end
