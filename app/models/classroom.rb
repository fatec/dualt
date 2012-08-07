class Classroom < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :contexts
  has_many :competences, :through => :contexts , :select => 'distinct competences.*'



  has_many :inscriptions
  has_many :students, :source => :user, :through => :inscriptions

  attr_accessible :name
  validates_presence_of :name

  # ajouter la fonction tested_competences pour trouver toutes les compétences testées d'une classe
  # comme ca ensuite on peut trouver tous les contextes pour chaque competence testée
  # par exemple class1.competences.find_by_name("competence 1")

  def tested_competences
    self.find(:all, :select => 'distinct competences_id')
  end
  
end
