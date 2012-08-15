#!/bin/env ruby
# encoding: utf-8

class BilanController < ApplicationController
  before_filter :authenticate_user!
  #TODO use cancan pour authoriser seulement les etudiants et rediriger les autres avec un message d'alerte a la page d'ou il venaient ou alors root

  def index
    if current_user.has_role?(:teacher) || current_user.has_role?(:admin)
      if params[:eleve]
        @student =  User.find(params[:eleve])
      else
        redirect_to admin_path, :alert => "Aucun étudiant séléctionné "
        return
      end
    elsif current_user.has_role?(:student)
      @student = current_user
    else
      redirect_to root_path, :alert => "Demandez à être inscrit dans le système pour voir votre bilan"
    end

    
    if !@student.current_classroom.nil? 
      #flash[:notice] = "Cool on a la classe #{current_user.current_classroom.name}"
      @competences = @student.current_classroom.tested_competences
    else
      #flash[:alert] = "Heu... pas de classe bilan#index"
      @competences = []
    end
    
  end




  # Affiche le détail d'un contexte
  def show
    
    if current_user.has_role?(:teacher) || current_user.has_role?(:admin)
      if params[:eleve]
        @student =  User.find(params[:eleve])
      else
        redirect_to admin_path, :alert => "Aucun étudiant séléctionné "
        return
      end
    elsif current_user.has_role?(:student)
      @student = current_user
    else
      redirect_to root_path, :alert => "Demandez à être inscrit dans le système pour voir votre bilan"
    end
    
    @context = Context.find(params[:id])
    
    
    if (@context.classroom == @student.current_classroom)    
      ### TODO : changer cette requette.. et mettre ca dans la classe compétence?
      @contexts = Context.where("classroom_id = ? AND competence_id = ?", @context.classroom, @context.competence)
      @competence = @context.competence
      @note = Note.where("context_id = ? AND student_id = ?", @context, @student).first
      if @note.nil?
        @note = Note.create(student: @student, context: @context)
      end 

    else
      redirect_to admin_path, :alert => "l'élève #{@student.name} n'est pas dans la classe #{@context.classroom.name} "
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
    
    @note = Note.where("context_id = ? AND student_id = ?", params[:id], current_user).first
 
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to bilan_path(params[:id], :student => current_user), notice: "note correctement mise à jour" }
        format.json { head :ok }
      end
    end
  end
  

  
  
end
