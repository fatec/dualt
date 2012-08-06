require 'spec_helper'

describe Classroom do
  it "has a valid factory" do
    FactoryGirl.create(:classroom).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:classroom, name: nil).should_not be_valid
  end
end
