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

  private

  def comment_params
    params.require(:comment)
      .permit( :content, :commentable_id, :commentable_type )
  end

end
