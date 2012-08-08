class Context < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :competence      , :foreign_key => :competence_id
  belongs_to :classroom       , :foreign_key => :classroom_id

  has_many :notes
  belongs_to :teacher , :class_name => 'User',            :foreign_key => :teacher_id, :conditions=> 'users.role="teacher"'
  
  
  #attr_accessible :name, :competence_id, :classroom_id, :teacher_id
  
  # TODO Regarder ce que fait attr_accessible => pour le rake:db:seed
#  attr_accessor :teacher
  attr_accessible :name, :competence, :classroom, :teacher, :competence_id, :classroom_id, :teacher_id
  
  validates_presence_of :name, :competence_id, :classroom_id, :teacher_id
  validates_associated :competence, :classroom
 
end
