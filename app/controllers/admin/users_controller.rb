#!/bin/env ruby
# encoding: utf-8

class Admin::UsersController < ApplicationController


   # GET /admin/users
   # GET /admin/users.json
   def index
     @users = User.all
     authorize! :read, User

     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @users }
     end
   end


   # GET /admin/users/1
   # GET /admin/users/1.json
   def show
     @user = User.find(params[:id])
      authorize! :read, @user

     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @user }
     end
   end


   # GET /admin/users/1/edit
   def edit
     @user = User.find(params[:id]) 
     authorize! :update, @user
   end

   # GET /admin/users/1/change_password
   def change_password
     @user = User.find(params[:id]) 
     authorize! :update, @user
   end

  # GET /admin/users/new
  # GET /admin/users/new.json
  def new
    @user = User.new
   # authorize! :read, User

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

   # POST /admin/users
   # POST /admin/users.json
   def create
     @user = User.new(params[:user])
     if params[:user][:classroom_ids].try(:first)
       @classe = Classroom.find(params[:user][:classroom_ids].first)
       #creer nouvelle inscription avec la date qui va bien
       inscription = Inscription.create(:student_id => @user, :classroom_id => @classe)
       @user.add_role :student
     end
          
     authorize! :create, @user

     respond_to do |format|
       if @user.save
         format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
         format.json { render json: @user, status: :created, location: [:admin,@user] }
       else
         format.html { render action: "new" }
         format.json { render json: @user.errors, status: :unprocessable_entity }
       end
     end
   end


     # PUT /admin/users/1
     # PUT /admin/users/1.json
     def update
       
       @user = User.find(params[:id])  
       if params[:user][:classroom_ids].try(:first)
         @classe = Classroom.find(params[:user][:classroom_ids].first)
         @user.add_role :student
         if @user.current_classroom == @classe
           #remove param
           params[:user].delete :classroom_ids
         else
           #creer nouvelle inscription avec la date qui va bien
           inscription = Inscription.create(:student_id => @user, :classroom_id => @classe)
         end
       end
      
       authorize! :update, @user
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to admin_users_url, notice: "L'utilisateur a été mis a jour." }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

     end  

     # DELETE /admin/users/1
     # DELETE /admin/users/1.json
     def destroy
       @user = User.find(params[:id])
       if Context.find_by_teacher_id(@user.id)
         redirect_to admin_users_url, notice: "On ne peut pas enlever les enseignants qui ont un contexte."
         return
       end
       authorize! :destroy, @user

       respond_to do |format|
         @user.destroy
         format.html { redirect_to admin_users_url }
         format.json { head :no_content }
       end
     end


end
