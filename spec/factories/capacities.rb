# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :capacity, :class => Capacity do |c|
    c.name { Faker::Lorem.words(2) }
    c.association :competence
  end


  factory :invalid_capacity, parent: :capacity do |c|
    c.name nil
  end
end
