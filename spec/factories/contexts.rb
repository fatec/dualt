# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do

  factory :context do
    name { Faker::Lorem.words(1)[0] }
    competence_id {FactoryGirl.create(:competence).id}
    classroom_id {FactoryGirl.create(:classroom).id}
    teacher_id {FactoryGirl.create(:teacher).id}
  end  

  
  
end
