# encoding: utf-8
class Admin::CommentsController < Admin::AdminController
  def index
    @comments = Comment.all
  end

  def validate
    @comment = Comment.find(params[:id])
    if @comment.is_valid === true
      @comment.is_valid = false
        if @comment.save
          flash[:notice] ="Ce commentaire n'est plus valide."
          flash[:class] = "success"
          redirect_to :back
        end
      elsif @comment.is_valid === false
        @comment.is_valid = true
        if @comment.save
          Notification.notify("Validation du Commentaire", @comment.id, "Comment", [@comment.user], current_user.id)
          Notification.notify("Nouveau Commentaire", @comment.id, "Comment", notification_receivers, @comment.user.id)
          flash[:notice] ="Le commentaire a été validé, les prochains commentaires seront directement mis en ligne"
          flash[:class] = "success"
          redirect_to :back
          end
      end
  end

  private

  def commentexport
    @comments = Comment.all
    respond_to do |format|
      format.html
      format.csv { send_data @comments.to_csv, filename: "comments-#{Date.today}.csv" }
    end
  end

  def comment_params
    params.require(:comment)
      .permit( :content, :commentable_id, :commentable_type )
  end

  def notification_receivers
    @receivers = []
    @comment.commentable.comments.each do |comment|
      if (!@receivers.include?(comment.user)) && (comment.user != @comment.user)
        @receivers.push(comment.user) #PERSONNES AYANT DEJA COMMENTé
      end
    end
    if (@comment.commentable.owner != @comment.user) && (!@receivers.include?(@comment.commentable.owner)) && (!@comment.commentable.owner.is_admin)
      @receivers.push(@comment.commentable.owner) #PROPRIETAIRE (article ou projet)
    end
    if @comment.commentable_type == "Project"
      @comment.commentable.interactions.each do |interaction|
        if !@receivers.include?(interaction.user) && (interaction.user != @comment.user)
          @receivers.push(interaction.user) #INTERAGISSANTS
        end
      end
    end
    return @receivers
  end


end
