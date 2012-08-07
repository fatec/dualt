# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    note_eleve  {Random.new.rand(0..2)}
    note_prof   {Random.new.rand(0..2)}
    author_id  {FactoryGirl.create(:context).id}
    note_id    {FactoryGirl.create(:note).id}
  end
end
