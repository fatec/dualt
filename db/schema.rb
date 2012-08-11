# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120811135133) do

  create_table "capacities", :force => true do |t|
    t.string   "name",          :null => false
    t.integer  "competence_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "capacities", ["competence_id"], :name => "index_capacities_on_competence_id"

  create_table "classrooms", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "comment",    :null => false
    t.integer  "note_id",    :null => false
    t.integer  "author_id",  :null => false
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
    t.string   "name",          :null => false
    t.integer  "competence_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "classroom_id",  :null => false
    t.integer  "teacher_id",    :null => false
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
    t.integer  "note_eleve",        :default => 0
    t.integer  "student_id",                       :null => false
    t.integer  "context_id",                       :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "note_prof",         :default => 0
    t.text     "commentaire_eleve"
    t.text     "commentaire_prof"
  end

  add_index "notes", ["context_id"], :name => "index_notes_on_context_id"
  add_index "notes", ["student_id"], :name => "index_notes_on_student_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "role"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
