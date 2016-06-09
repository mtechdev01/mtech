class Users::AccountController < ApplicationController
  before_action :authenticate_user!
  layout "user"

  def account
  end

  def projects
    @created_projects = Project.lastProjects(current_user)
    @supported_projects = Array.new
    @participated_projects = Array.new
    Interaction.where(user: current_user).each do |interaction|
        @project = interaction.project
        if interaction.role == "support"
          @supported_projects.push(@project)
        else
          @participated_projects.push(@project)
        end
    end
  end

  def comments
     @comments = Comment.where(user: current_user).order(created_at: "desc")
  end


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


  def likes
    @likes = Like.where(user: current_user).order(created_at: "desc")
  end

  def sondages
    @responses = SurveysResponse.responsed(current_user)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      flash[:notice] = "La mise à jour à été effectuée"
      flash[:class]= "success"
      redirect_to users_Account_url
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  private

  def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :avatar, :cp, :city, :is_registered, :country, :address, :territory_attachment)
  end

end
