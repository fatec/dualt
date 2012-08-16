class Inscription < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to  :student  , :class_name => 'User',       :foreign_key => "student_id"
  belongs_to :classroom     , :foreign_key => "classroom_id"
  
  #validates_uniqueness_of :student_id, :scope => [:year]
  validates_format_of :year, :with => /^\d{4}$/
  
  
  attr_accessible :student_id, :classroom_id, :year
  
  before_save      :set_year
  before_validation :set_year
  
  
  def set_year
    self.year = Time.new.year
  end
  
end
