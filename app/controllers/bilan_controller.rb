#!/bin/env ruby
# encoding: utf-8

class BilanController < ApplicationController
  before_filter :authenticate_user!
  #TODO use cancan pour authoriser seulement les etudiants et rediriger les autres avec un message d'alerte a la page d'ou il venaient ou alors root

  def index
    
     params[:student] ?  user = User.find(params[:student]) : user = current_user 
    
    if !user.current_classroom.nil? 
      #flash[:notice] = "Cool on a la classe #{current_user.current_classroom.name}"
      @competences = user.current_classroom.tested_competences
    else
      #flash[:alert] = "Heu... pas de classe bilan#index"
      @competences = []
    end
    if (params[:student] && User.find(params[:student]) != current_user)
      authorize! :read, :other_bilan
    end
    
  end




  # Affiche le détail d'un contexte
  def show
    params[:student] ?  user = User.find(params[:student]) : user = current_user
    
    @context = Context.find(params[:id])
    
    
    if (@context && @context.classroom == user.current_classroom)    
      ### TODO : changer cette requette.. et mettre ca dans la classe compétence?
      @contexts = Context.where("classroom_id = ? AND competence_id = ?", @context.classroom, @context.competence)
      @competence = @context.competence
      @note = Note.where("context_id = ? AND student_id = ?", @context, user).first
      if @note.nil?
        @note = Note.create(student: user, context: @context)
      end 
    
      if (params[:student] && User.find(params[:student]) != current_user)
        authorize! :read, :other_bilan
      end
      authorize! :read, @note
    else
      redirect_to root_path, :alert => "l'élève #{user.name} n'est pas dans la classe #{@context.classroom.name} ( il est dans #{user.current_classroom.name} ) "
    end

    ###########
    ###
    ### Ca c'est pour si on a une table commentaires séparée..
    ###
    ###  @comment = Comment.new( :note => @note, :author_id => current_user.id )
    ###
    ##########
    

  end
  
  
  # PUT /bilan/[context.id]
  def update
    
    params[:student] ?  user = User.find(params[:student]) : user = current_user
    
    @note = Note.where("context_id = ? AND student_id = ?", params[:id], user).first
 
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to bilan_path(params[:id], :student => user), notice: "note correctement mise à jour" }
        format.json { head :ok }
      end
    end
  end
  

  
  
end
