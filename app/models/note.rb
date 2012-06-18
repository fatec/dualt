class Note < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user     , :foreign_key => "student_id"
  belongs_to :context   , :foreign_key => "context_id"
  has_one :competence   , :through => :context
  
  attr_accessible :user, :context, :note_eleve
end
