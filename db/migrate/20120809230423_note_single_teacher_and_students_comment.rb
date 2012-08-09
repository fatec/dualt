class NoteSingleTeacherAndStudentsComment < ActiveRecord::Migration
  def up
    add_column      :notes, :commentaire_eleve, :text
    add_column      :notes, :commentaire_prof, :text
  end

  def down
    remove_column :notes, :commentaire_eleve
    remove_column :notes, :commentaire_prof
  end
end
