class LikesController < ApplicationController

  def create
    if !liked?
      @like = Like.new like_params
      @like.user = current_user
      @like.save
      Notification.notify("Nouveau Like", @like.likeable_id, @like.likeable_type, notification_receivers, current_user.id)
      flash[:notice]  = "Vous aimez."
      flash[:class]   = "success"
      redirect_to :back
    else
      @like = Like.where(user: current_user).where(like_params).last
      @like.destroy
      flash[:notice]  = "Vous n'aimez plus."
      flash[:class]   = "danger"
      redirect_to :back
    end
  end

  def liked?
    @like = Like.where(user: current_user).where(like_params).last
    if @like
      return true
    else
      return false
    end
  end

  private

  def like_params
    params.require(:like)
      .permit( :likeable_id, :likeable_type )
  end

  def notification_receivers
    @receivers = []
    User.where(is_admin: true).each do |admin|
      if admin != @like.user
        @receivers.push(admin)  #ADMINS
      end
    end
    return @receivers
  end
    
end
