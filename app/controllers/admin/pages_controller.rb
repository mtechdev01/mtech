class Admin::PagesController < Admin::AdminController
    
  def notifications
    @notifications = Notification.where(user: current_user).where(read: false).order(created_at: "desc")
  end
    
  def mark_as_read
    @notifications = Notification.where(user: current_user).where(read: false).order(created_at: "desc")
    @notifications.each do |notification|
        notification.update(read: true)
    end
    redirect_to :back
  end

  def notifications
    @notifications = Notification.where(user: current_user).where(read: false).order(created_at: "desc")
  end

  def dashboard
    @projects = Project.all  
    @comments = Comment.all
    @users = User.all
    @articles = Article.all
  end

  def documentation
    #code
  end

end
