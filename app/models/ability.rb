class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.has_role? :student
      can :read, :all
      can :update, :note do |note|
        note.try(:student) == current_user && note.try(:note_eleve) == 0 
      end
      
      cannot :read, :other_bilan
      
      
      cannot :read, Classroom
    end
    
    if user.has_role? :teacher
      can :read, :all

      can :create, Context
      #peut mettre a jour un contexte si il lui appartient
      can :update, Context do |context|
            context.teacher == user
      end
      
    end
    
    if user.has_role? :admin
      can :manage, :all
      # Pas possible d'effacer les classes qui ont des étudiants
      cannot :destroy, Classroom  do |classroom|
            classroom.students.count != 0
      end
      
      cannot :destroy, Context
    end

    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
