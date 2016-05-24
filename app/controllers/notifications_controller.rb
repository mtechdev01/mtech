class NotificationsController  < ApplicationController
=begin  def notify
    toAdmin()
  end

  private comment
  def toAdmin
    User.where(is_admin: true).each do |admin|
      if admin != comment.user
        @receivers.push(admin)
      end
    end
    return @receivers
  end

  def otheruser
    @comment.commentable.comments.each do |comment|
      if !@receivers.include?(comment.user) && comment.user != @comment.user
        @receivers.push(comment.user)
      end
    end
  end
=end
end
