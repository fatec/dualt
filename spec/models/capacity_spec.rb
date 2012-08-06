require 'spec_helper'

describe Capacity do
  it "has a valid factory" do
    FactoryGirl.create(:capacity).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:capacity, name: nil).should_not be_valid
  end

  it "is invalid without a competence" do
    FactoryGirl.build(:capacity, competence: nil).should_not be_valid
  end
  
end
