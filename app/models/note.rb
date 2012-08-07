class Note < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user     , :foreign_key => "student_id"
  belongs_to :context   , :foreign_key => "context_id"
  has_one :competence   , :through => :context
  has_many :comments
  
  attr_accessible :user, :context, :note_eleve
  
  validates :note_eleve, :note_prof, :numericality => { :only_integer => true , :message => "Seulement un entier"}
  
  validates :note_eleve, :note_prof, :inclusion => { :in => 0..3,
    :message => "%{value} Seulement 1, 2 ou 3" }
    
  
    validates_presence_of :context_id, :student_id
    
end
