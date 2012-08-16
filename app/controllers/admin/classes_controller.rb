#!/bin/env ruby
# encoding: utf-8

class Admin::ClassesController < ApplicationController
before_filter :authenticate_user!


  # GET /admin/classes
  # GET /admin/classes.json
  def index
    @classes = Classroom.all
    authorize! :read, Classroom

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classes }
    end
  end
  

  # GET /admin/classes/1
  # GET /admin/classes/1.json
  def show
    @classe = Classroom.find(params[:id])
     authorize! :read, @classe

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classe }
    end
  end
  
  
  # GET /admin/classes/1/edit
  def edit
    @classe = Classroom.find(params[:id]) 
    authorize! :update, @classe
  end

 # GET /admin/classes/new
 # GET /admin/classes/new.json
 def new
   @classe = Classroom.new
   authorize! :read, Classroom

   respond_to do |format|
     format.html # new.html.erb
     format.json { render json: @classe }
   end
 end
  
  # POST /admin/contexts
  # POST /admin/contexts.json
  def create
    @classe = Classroom.new(params[:classroom])
    authorize! :create, @classe

    respond_to do |format|
      if @classe.save
        format.html { redirect_to admin_classrooms_url, notice: 'Classroom was successfully created.' }
        format.json { render json: @classe, status: :created, location: [:admin,@classe] }
      else
        format.html { render action: "new" }
        format.json { render json: @classe.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
    # PUT /admin/classes/1
    # PUT /admin/classes/1.json
    def update
      @classe = Classroom.find(params[:id])  
      authorize! :update, @classe

     respond_to do |format|
       if @classe.update_attributes(params[:classroom])
         format.html { redirect_to admin_classrooms_url, notice: "La classe a été mise à jour avec le nom #{@classe.name}." }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @classe.errors, status: :unprocessable_entity }
       end
     end
    end  

    # DELETE /admin/classes/1
    # DELETE /admin/classes/1.json
    def destroy
      @classe = Classroom.find(params[:id])
      authorize! :destroy, @classe
      
      respond_to do |format|
        if @classe.students.count > 0
          format.html { redirect_to admin_classrooms_url, alert: "Il n'est pas possible d'enlever une classe qui contient des élèves"  }
          format.json { head :no_content }
        else
          @classe.destroy
          format.html { redirect_to admin_classrooms_url }
          format.json { head :no_content }
        end
      end
    end

  
end
