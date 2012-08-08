# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    comment { Faker::Lorem.sentence[0] }
    author_id  {FactoryGirl.create(:context).id}
    note_id    {FactoryGirl.create(:note).id}
  end
end
