class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :role, :email, :password, :password_confirmation, :remember_me
  
  
    has_many :inscriptions, :foreign_key => "student_id"
    has_many :classrooms, :through => :inscriptions

  #  has_many :contexts, , Context.where()
    

    has_many :notes
  #  has_one :context, :through => :notes

 

  def current_classroom
    self.classrooms.first
  end

  def name
    "#{first_name} #{last_name}"
  end



  
end
