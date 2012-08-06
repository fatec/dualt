# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :classroom  do |c|
    c.name { Faker::Name.first_name }
  end

end
