class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'

    # Si Prof
    # => Ajouter une compétence
    # => Voir toutes ses compétences
    # => Voir la liste des classes
    # => Gérer les notes
    if current_user.has_role? :teacher
      @users = User.teachers

      # Si Elève
      # => Bilan
    elsif @current_user.has_role? :student      
      @users = User.students
      if !current_user.current_classroom.nil?
        @competences = current_user.current_classroom.competences
      else
        @competences = []
      end

      # Sinon.. afficher une page pour demander d'ajouter la personne dans une classe
    else


    end 

  end

  def show
    @user = User.find(params[:id])
  end

end
