# encoding: utf-8
class CommentsController  < ApplicationController

  def create
    @comment = Comment.new comment_params
    @comment.user = current_user
    if @comment.save
      flash[:notice]  = "Commentaire enregistré"
      flash[:class]   = "success"
      redirect_to :back
    else
      flash[:notice]  = "erreur sur l'enregistrement du commentaire"
      flash[:class]   = "danger"
      redirect_to :back
    end
  end
    
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
        flash[:notice] = "Le commentaire a été mis à jour"
      flash[:class]= "success"
      redirect_to :back
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end    
    
    

  def destroy
    @comment = Comment.find(params[:id])
    if @comment != nil
      @comment.destroy
      flash[:notice] ="Ce commentaire a été supprimé"
      flash[:class] = "success"
      redirect_to :back
    else
        flash[:notice] ="Ce commentaire est inexistant"
      flash[:class] = "danger"
      redirect_to :back
    end
  end
    
    
    
    
  private

  def comment_params
    params.require(:comment)
      .permit( :content, :commentable_id, :commentable_type )
  end

end
