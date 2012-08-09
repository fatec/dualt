#!/bin/env ruby
# encoding: utf-8

class Admin::ContextsController < ApplicationController
  

  # GET /admin/contexts
  # GET /admin/contexts.json
  def index
    @contexts = Context.order(:classroom_id)
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contexts }
    end
  end


 # GET /admin/contexts/1
 # GET /admin/contexts/1.json
 def show
   @context = Context.find(params[:id])
   @notes = @context.initialize_notes
   
   respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @context }
   end
 end
  
  # GET /admin/contexts/new
  # GET /admin/contexts/new.json
  def new
    @context = Context.new
    @competences = Competence.all
    @classrooms = Classroom.all
    @teachers = User.teachers

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end
  
  # POST /admin/contexts
  # POST /admin/contexts.json
  def create
    @context = Context.new(params[:context])

    respond_to do |format|
      if @context.save
        format.html { redirect_to admin_contexts_url, notice: 'Context was successfully created.' }
        format.json { render json: @context, status: :created, location: [:admin,@context] }
      else
        format.html { render action: "new" }
        format.json { render json: @context.errors, status: :unprocessable_entity }
      end
    end
  end
 

    
  
  # GET /admin/contexts/1/edit
  def edit
    @context = Context.find(params[:id]) 
    @competences = Competence.all
    @classrooms = Classroom.all
    @teachers = User.teachers
  end
  
    
  # PUT /admin/contexts/1
  # PUT /admin/contexts/1.json
  def update
    @context = Context.find(params[:id]) 

   respond_to do |format|
     if @context.update_attributes(params[:context])
       format.html { redirect_to admin_contexts_url, notice: "Context was successfully updated avec le nom #{@context.name}." }
       format.json { head :no_content }
     else
       format.html { render action: "edit" }
       format.json { render json: @context.errors, status: :unprocessable_entity }
     end
   end
  end
  
  # DELETE /admin/contexts/1
  # DELETE /admin/contexts/1.json
  def destroy
    @context = Context.find(params[:id])
    @context.destroy

    respond_to do |format|
      format.html { redirect_to admin_contexts_url }
      format.json { head :no_content }
    end
  end  
  
  
  # PUT /admin/update_individual_notes/1
  # PUT /admin/update_individual_notes/1.json
  def update_individual_notes
    @notes = Note.update(params[:notes].keys, params[:notes].values).reject { |p| p.errors.empty? }
      
    
    if @notes.empty?
      flash[:notice] = "Notes updated"
      redirect_to admin_context_path(params[:id])
    else
      flash[:alert] = "Attention certaines notes n'ont pas été mise à jour"
      redirect_to admin_context_path(params[:id])
    end
  end
  
end
