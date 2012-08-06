# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email {|x| "#{x.first_name}.#{x.last_name}@test.com"}
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
  
  
  factory :teacher, parent: :user do |u|
    u.role "teacher"
  end
  
  factory :student, parent: :user do |u|
    u.role "student"
  end
  
  factory :user_no_role, parent: :user do |u|
    u.role ""
  end
  
  factory :user_nil_role, parent: :user do |u|
    u.role nil
  end
  
end