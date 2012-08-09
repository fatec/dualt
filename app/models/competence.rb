class Competence < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :contexts
  has_many :capacities

  
  attr_accessible :name

  validates_presence_of :name
#  validates :name, :presence => true

  
  def bilan(eleve)
    # On met le bilan de l'utilisateur dans un hash bilan[0] 
    bilan = Hash.new(0)
    bilan[0] = 0
    bilan[1] = 0
    bilan[2] = 0
    bilan[3] = 0
    
    Context.where(:competence_id => self, :classroom_id => eleve.current_classroom).each do |context|
      bilan[context.note_eleve(eleve).note_eleve] += 1
    end
    bilan
  end
  
end
