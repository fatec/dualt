#!/bin/env ruby
# encoding: utf-8

class BilanController < ApplicationController
  before_filter :authenticate_user!
  #TODO use cancan pour authoriser seulement les etudiants et rediriger les autres avec un message d'alerte a la page d'ou il venaient ou alors root

  def index
    if current_user.student

      if !current_user.current_classroom.nil? 
        #flash[:notice] = "Cool on a la classe #{current_user.current_classroom.name}"
        @competences = current_user.current_classroom.competences
        
      else
        #flash[:alert] = "Heu... pas de classe bilan#index"
        @competences = []
      end
    elsif current_user.teacher
      redirect_to admin_contexts_url
    else
      redirect_to root_url
    end

  end

  # Affiche le détail d'un contexte
  def show
    if current_user.student
      
      
      @context = Context.find(params[:id])
      
      classe_eleve = current_user.current_classroom.id 
      classe_du_contexte = @context.classroom_id
      
      if  classe_eleve != classe_du_contexte
        redirect_to bilan_index_url , :alert => "la classe de l'élève (id:#{classe_eleve}) ne correspond pas à la classe du contexte (id:#{classe_du_contexte})"
      else
        @contexts = Context.where("classroom_id = ? AND competence_id = ?", @context.classroom, @context.competence)
        
        @note = Note.where("context_id = ? AND student_id = ?", @context, current_user).first
        if @note.nil?
          @note = Note.create(student: current_user, context: @context)
        end
        #@comment = @note.comments.build(:note_id => @note.id)
        @comment = Comment.new( :note => @note, :author_id => current_user.id )
      end
      
      
    else
      redirect_to root_url, :alert => 'Your book was not found!'
    end
  end
  
  
  # PUT /bilan/[context.id]
  def update
    
    
    @note = Note.where("context_id = ? AND student_id = ?", params[:id], current_user).first
 
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to bilan_path(params[:id]), notice: "note correctement mise à jour" }
        format.json { head :ok }
      end
    end
  end
  

  
  
end
