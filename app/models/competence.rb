class Competence < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :contexts
  has_many :capacities
  
  attr_accessible :name

  def bilan_note_eleve(user)
    # on compte combien de chaque type de note
    # pour chaque contexte
    bilan = {}
    user.classrooms.first.competences.find(self).contexts.each do |context|
      # pour chaque contexte récupérer la note de l'élève
      # si note n'existe pas creer l'objet et donner 0 a note_eleve
      note = context.notes.find_or_initialize_by_user_id(user)   do |n|
        n.note_eleve = 0
      end
      note.save!
      if bilan[note.note_eleve].nil?
         bilan[note.note_eleve] = 1
      else
         bilan[note.note_eleve] += 1
      end
    end
    bilan
  end
end
