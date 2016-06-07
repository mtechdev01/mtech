class NewslettersController  < ApplicationController

  def new
    @newsletter = Newsletter.new newsletter_params
    @newsletter.created_at = DateTime.now
    if @newsletter.save
      Notification.notify("Nouvelle souscription à la Newsletter", nil, nil, User.where(is_admin: true), nil)
      flash[:notice]  = "Vous êtes inscrit à la Newsletter"
      flash[:class]   = "success"
      redirect_to :back
    else
      flash[:notice]  = @newsletter.errors[:email].join.to_s
      flash[:class]   = "danger"
      redirect_to :back
    end
  end

private

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end

end
