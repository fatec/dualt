# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :inscription do
    year { Time.new.year }
    student_id {FactoryGirl.create(:user, :role=>"student").id}
    classroom_id {FactoryGirl.create(:classroom).id}
  end

    
end
