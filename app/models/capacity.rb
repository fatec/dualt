class Capacity < ActiveRecord::Base
  # attr_accessible :title, :body
   belongs_to :competence , :foreign_key => "competence_id"
   
   attr_accessible :name, :competence
   
   validates_presence_of :name, :competence_id
   validates_associated :competence
   
end
