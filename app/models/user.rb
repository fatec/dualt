class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :role, :email, :password, :password_confirmation, :remember_me
  
  
    has_many :inscriptions, :foreign_key => "student_id"
    has_many :classrooms, :through => :inscriptions


    has_many :notes
  #  has_one :context, :through => :notes

    def is_admin?
      #TODO retourner oui s'il est admin... on l'avait deviné!
      true
    end

  #  before_save :cleanup

    def current_classroom
      self.classrooms.first
    end

    def name
      "#{first_name} #{last_name}"
    end
  
  
  
  def has_role?(role)
    return self.role == role
  end
  

  
  scope :admins, :conditions => { :role => :admin }
  scope :students, :conditions => { :role => :student }
  scope :teachers, :conditions => { :role => :teacher }

  
end
