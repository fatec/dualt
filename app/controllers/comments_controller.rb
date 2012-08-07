class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(params[:comment])
 
    if @comment.save
      ;flash[:notice] = 'Comment was successfully created.'
      redirect_to bilan_path(@comment.note.context)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to bilan_path(@comment.note.context)
    end
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
 
    redirect_to bilan_path(@comment.note.context)
  end
  
end
