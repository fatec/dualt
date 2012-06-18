class Capacity < ActiveRecord::Base
  # attr_accessible :title, :body
   belongs_to :competence , :foreign_key => "competence_id"
   
   attr_accessible :name, :competence
   
end
