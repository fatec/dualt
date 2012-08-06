# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :competence , :class => Competence do |c|
    c.name { Faker::Name.first_name }
    c.detail { Faker::Lorem.sentence }
    c.file   "un/chemin/vers/un/pdf"
  end 
  
end
