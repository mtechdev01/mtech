# encoding: utf-8
class CommentsController  < ApplicationController

  def create
    @comment = Comment.new comment_params
    @comment.user = current_user
    if @comment.user.is_admin || !is_first
      @comment.is_valid = true
    else
      @comment.is_valid = false
    end
    if @comment.save && @comment.is_valid
      Notification.notify("Nouveau Commentaire", @comment.id, "Comment", notification_receivers, current_user.id)
      flash[:notice]  = "Commentaire enregistré"
      flash[:class]   = "success"
      redirect_to :back
    elsif @comment.save
      Notification.notify("Nouveau Commentaire en attente de validation", @comment.id, "Comment", User.where(is_admin: true), current_user.id)
      flash[:notice]  = "Votre commentaire va être validé par un administrateur avant d'être mis en ligne"
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
      Notification.where(notifiable_type: "Comment", notifiable_id: @comment.id).find_each do | notif |
          notif.destroy
      end
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

  def is_first
    @comments = Comment.where( { user_id: current_user.id, is_valid: true } ).first
    if @comments
      return false
    else
      return true
    end
  end

  def comment_params
    params.require(:comment)
      .permit( :content, :commentable_id, :commentable_type )
  end

  def notification_receivers
    @receivers = []
    User.where(is_admin: true).each do |admin|
      if admin != @comment.user #celui qui commente n'est pas admin
        @receivers.push(admin) #push admin
      end
    end
    @comment.commentable.comments.each do |comment|
      if (!@receivers.include?(comment.user)) && (comment.user != @comment.user) #push des gens qui ont déjà comment, sans celui qui est en train de commenter, et sans les admins
        @receivers.push(comment.user)
      end
    end
    if (@comment.commentable.owner != @comment.user) && (!@receivers.include?(@comment.commentable.owner))#test proprio de ce qui est commenté n'est pas celui qui commente ET si le propriètaire n'est pas déjà dans le tableau (déjà comment ou admin)
       @receivers.push(@comment.commentable.owner)
    end
    if @comment.commentable_type == "Project"
     @comment.commentable.interactions.each do |interaction|
       if !@receivers.include?(interaction.user) && (interaction.user != @comment.user)
         @receivers.push(interaction.user)#push les gens qui ont intéragit, si ils ne sont pas déjà dans le tableau
       end
     end
    end
    return @receivers
  end

end
