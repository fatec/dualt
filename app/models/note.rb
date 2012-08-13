#!/bin/env ruby
# encoding: utf-8

class Note < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :student  , :class_name => 'User',    :foreign_key => :student_id
  belongs_to :context   , :foreign_key => "context_id"
  has_one :competence   , :through => :context
 # has_many :comments
  
 # has_many :commentaires_eleve, :class_name => 'Comment'  do 
 #   def filter(note)
 #     find(:all, :conditions => {:author_id => note.student})
 #   end
 # end
  
  
 # has_many :commentaires_prof, :class_name => 'Comment'  do 
 #   def filter(note)
 #     find(:all, :where => {:author_id => note.student})
 #   end
 # end
  
  
  def note_prof_text
    case self.note_prof
    when 0
      "sans évaluation"
    when 1
      "A revoir"
    when 2
      "Moyen"
    when 3
      "Bon"
    else
      self.note_prof
    end
  end
  
  def note_eleve_text
    case self.note_eleve
    when 0
      "sans évaluation"
    when 1
      "A revoir"
    when 2
      "Moyen"
    when 3
      "Bon"
    else
      self.note_eleve
    end
  end
  
  
  attr_accessible :student, :context, :note_eleve, :note_prof, :commentaire_eleve, :commentaire_prof
  
  validates :note_eleve, :note_prof, :numericality => { :only_integer => true , :message => "Seulement un entier"}
  
  validates :note_eleve, :note_prof, :inclusion => { :in => 0..3,
    :message => "%{value} Seulement 1, 2 ou 3" }
    
  
    validates_presence_of :context_id, :student_id
    
end
