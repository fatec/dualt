class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments, :force => true do |t|
      t.text   "comment",           :null => false
      t.integer  "note_id",         :null => false
      t.integer  "author_id",       :null => false
      t.datetime "created_at",      :null => false
      t.datetime "updated_at",      :null => false
    end
    
    remove_column :notes, :comment
    
  end
  
  def down
    drop_table      :comments
    add_column      :notes, :comment, :text
  end
end
