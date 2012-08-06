class Inscription < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user          , :foreign_key => "student_id"
  belongs_to :classroom     , :foreign_key => "classroom_id"
  
  validates_uniqueness_of :student_id, :scope => [:year]
  validates_format_of :year, :with => /^\d{4}$/
  
  
  attr_accessible :user, :classroom, :year
  
end
