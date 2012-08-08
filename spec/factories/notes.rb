# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  #context = FactoryGirl.create(:context) 
  #FactoryGirl.create(:inscription, :classroom_id => context.classroom)
  #FactoryGirl.create(:inscription, :classroom_id => context.classroom)
  
  factory :note do
    note_eleve  {Random.new.rand(0..2)}
    note_prof   {Random.new.rand(0..2)}
#    context_id {context.id}
#    student_id {context.classroom.students.first.id}
    context_id {FactoryGirl.create(:context).id}
    student_id {FactoryGirl.create(:user, :role => "student").id}
  end
end
