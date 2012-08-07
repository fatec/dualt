class Comment < ActiveRecord::Base
  belongs_to :note , :foreign_key => :note_id
  attr_accessible :comment, :author_id, :note_id
end
