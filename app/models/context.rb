class Context < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :competence      , :foreign_key => "competence_id"
  belongs_to :classroom       , :foreign_key => "classroom_id"

  has_many :notes
  belongs_to :user, :conditions => [:role => :teacher]
  
  attr_accessible :name, :competence, :classroom, :user
  
end
