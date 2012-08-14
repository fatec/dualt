class Competence < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :contexts
  has_many :capacities

  

  
 has_many :classroom_contexts, :class_name => 'Context'  do 
    def filter(note)
      find(:all, :conditions => {:author_id => note.student})
    end
 end
 
  
  attr_accessible :name

  validates_presence_of :name
#  validates :name, :presence => true

  
  def bilan(eleve)
    # On met le bilan de l'utilisateur dans un hash bilan[0] 
    bilan = Hash.new(0)
    bilan[:student] = Hash.new(0)
    bilan[:teacher] = Hash.new(0)
    bilan[:student][0] = 0
    bilan[:student][1] = 0
    bilan[:student][2] = 0
    bilan[:student][3] = 0
    bilan[:teacher][0] = 0
    bilan[:teacher][1] = 0
    bilan[:teacher][2] = 0
    bilan[:teacher][3] = 0
    
    Context.where(:competence_id => self, :classroom_id => eleve.current_classroom).each do |context|
      bilan[:student][context.note_eleve(eleve).note_eleve] += 1
      bilan[:teacher][context.note_eleve(eleve).note_prof] += 1
    end
    bilan
  end
  
  
  def contexts_by_classroom(classe)
    #trouver tous les contextes de la classe
    self.contexts.where(:classroom_id => classe.id)
  end
  
end
