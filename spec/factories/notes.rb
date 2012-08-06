# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    note_eleve  {Random.new.rand(0..2)}
    note_prof   {Random.new.rand(0..2)}
    comment      { Faker::Lorem.paragraph }
    context_id {FactoryGirl.create(:context).id}
    student_id {FactoryGirl.create(:student).id}
  end
end
