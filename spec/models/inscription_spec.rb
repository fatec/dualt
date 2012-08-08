require 'spec_helper'

describe Inscription do
  
  it "has a valid factory"do
    FactoryGirl.create(:inscription).should be_valid
  end
  
  it "fails if student is in two different classroom in the same year"do
    student = FactoryGirl.create(:user, :role =>"student")
    classroom1 = FactoryGirl.create(:classroom)
    classroom2 = FactoryGirl.create(:classroom)
    FactoryGirl.create(:inscription, :year => 2012, :student_id => student.id, :classroom_id => classroom1.id)
    FactoryGirl.build(:inscription, :year => 2012, :student_id => student.id, :classroom_id => classroom2.id).should_not be_valid
  end
  
  it "fails if year is not in the time.new.year format" do
    FactoryGirl.build(:inscription, :year => 12).should_not be_valid
  end
  
end
