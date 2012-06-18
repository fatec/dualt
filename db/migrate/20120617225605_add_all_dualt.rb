class AddAllDualt < ActiveRecord::Migration
  def up
    create_table "capacities", :force => true do |t|
       t.string   "name"
       t.integer  "competence_id"
       t.datetime "created_at",    :null => false
       t.datetime "updated_at",    :null => false
     end

     add_index "capacities", ["competence_id"], :name => "index_capacities_on_competence_id"

     create_table "classrooms", :force => true do |t|
       t.string   "name"
       t.datetime "created_at", :null => false
       t.datetime "updated_at", :null => false
     end

     create_table "competences", :force => true do |t|
       t.string   "name"
       t.datetime "created_at", :null => false
       t.datetime "updated_at", :null => false
       t.text     "detail"
       t.string   "file"
     end

     create_table "contexts", :force => true do |t|
       t.string   "name"
       t.integer  "competence_id"
       t.datetime "created_at",    :null => false
       t.datetime "updated_at",    :null => false
       t.integer  "classroom_id"
       t.integer  "teacher_id"
     end

     add_index "contexts", ["competence_id"], :name => "index_contexts_on_competence_id"

     create_table "inscriptions", :force => true do |t|
       t.string   "year"
       t.integer  "student_id"
       t.integer  "classroom_id"
       t.datetime "created_at",   :null => false
       t.datetime "updated_at",   :null => false
     end

     add_index "inscriptions", ["classroom_id"], :name => "index_inscriptions_on_classroom_id"
     add_index "inscriptions", ["student_id"], :name => "index_inscriptions_on_student_id"

     create_table "notes", :force => true do |t|
       t.integer  "note_eleve"
       t.integer  "student_id"
       t.integer  "context_id"
       t.datetime "created_at", :null => false
       t.datetime "updated_at", :null => false
       t.text     "comment"
       t.integer  "note_prof"
     end

     add_index "notes", ["context_id"], :name => "index_notes_on_context_id"
     add_index "notes", ["student_id"], :name => "index_notes_on_student_id"
     
     
     add_column :users, :last_name, :string
     rename_column :users, :name, :first_name
     
  end

  def down
    drop table :inscriptions
    drop table :contexts
    drop table :notes
    drop table :competences
    drop table :classrooms
    drop table :capacities
  end
end
