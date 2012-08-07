class AddAllDualt < ActiveRecord::Migration
  def up
    create_table "capacities", :force => true do |t|
       t.string   "name",           :null => false
       t.integer  "competence_id",  :null => false
       t.datetime "created_at",     :null => false
       t.datetime "updated_at",     :null => false
     end

     add_index "capacities", ["competence_id"], :name => "index_capacities_on_competence_id"

     create_table "classrooms", :force => true do |t|
       t.string   "name",       :null => false
       t.datetime "created_at", :null => false
       t.datetime "updated_at", :null => false
     end

     create_table "competences", :force => true do |t|
       t.string   "name",       :null => false
       t.datetime "created_at", :null => false
       t.datetime "updated_at", :null => false
       t.text     "detail"
       t.string   "file"
     end

     create_table "contexts", :force => true do |t|
       t.string   "name",           :null => false
       t.integer  "competence_id",  :null => false
       t.datetime "created_at",     :null => false
       t.datetime "updated_at",     :null => false
       t.integer  "classroom_id",   :null => false
       t.integer  "teacher_id",     :null => false
     end

     add_index "contexts", ["competence_id"], :name => "index_contexts_on_competence_id"

     create_table "inscriptions", :force => true do |t|
       t.string   "year",         :null => false
       t.integer  "student_id",   :null => false
       t.integer  "classroom_id", :null => false
       t.datetime "created_at",   :null => false
       t.datetime "updated_at",   :null => false
     end

     add_index "inscriptions", ["classroom_id"], :name => "index_inscriptions_on_classroom_id"
     add_index "inscriptions", ["student_id"], :name => "index_inscriptions_on_student_id"

     create_table "notes", :force => true do |t|
       t.integer  "note_eleve", :default => 0
       t.integer  "student_id", :null => false
       t.integer  "context_id", :null => false
       t.datetime "created_at", :null => false
       t.datetime "updated_at", :null => false
       t.text     "comment"
       t.integer  "note_prof",  :default => 0
     end

     add_index "notes", ["context_id"], :name => "index_notes_on_context_id"
     add_index "notes", ["student_id"], :name => "index_notes_on_student_id"
     
     
     add_column :users, :last_name, :string
     rename_column :users, :name, :first_name
     
  end

  def down
    drop_table :inscriptions
    drop_table :contexts
    drop_table :notes
    drop_table :competences
    drop_table :classrooms
    drop_table :capacities
  end
end
