class Inscription < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user          , :foreign_key => "student_id"
  belongs_to :classroom     , :foreign_key => "classroom_id"
  
  attr_accessible :user, :classroom
end
