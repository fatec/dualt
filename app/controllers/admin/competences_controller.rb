class Admin::CompetencesController < ApplicationController

  before_filter :authenticate_user!


    # GET /admin/competences
    # GET /admin/competences.json
    def index
      @competences = Competence.all
      authorize! :read, Competence

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @competences }
      end
    end


   # GET /admin/competences/1
   # GET /admin/competences/1.json
   def show
     @competence = Competence.find(params[:id])
     authorize! :show, @competence

     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @competence }
     end
   end

    # GET /admin/competences/new
    # GET /admin/competences/new.json
    def new
      @competence = Competence.new
      authorize! :update, Competence

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @article }
      end
    end

    # POST /admin/competences
    # POST /admin/competences.json
    def create
      @competence = Competence.new(params[:competence])
      authorize! :create, @competence

      respond_to do |format|
        if @competence.save
          format.html { redirect_to admin_competences_url, notice: 'Competence was successfully created.' }
          format.json { render json: @competence, status: :created, location: [:admin,@competence] }
        else
          format.html { render action: "new" }
          format.json { render json: @competence.errors, status: :unprocessable_entity }
        end
      end
    end




    # GET /admin/competences/1/edit
    def edit
      @competence = Competence.find(params[:id]) 
      authorize! :update, @competence
    end


    # PUT /admin/competences/1
    # PUT /admin/competences/1.json
    def update
      @competence = Competence.find(params[:id]) 
      authorize! :update, @competence

     respond_to do |format|
       if @competence.update_attributes(params[:competence])
         format.html { redirect_to admin_competences_url, notice: "Competence was successfully updated avec le nom #{@competence.name}." }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @competence.errors, status: :unprocessable_entity }
       end
     end
    end

    # DELETE /admin/competences/1
    # DELETE /admin/competences/1.json
    def destroy
      @competence = Competence.find(params[:id])
      authorize! :destroy, @competence


      @competence.destroy

      respond_to do |format|
        format.html { redirect_to admin_competences_url }
        format.json { head :no_content }
      end
    end  



end
