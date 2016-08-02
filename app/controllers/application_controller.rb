# encoding: utf-8
class ApplicationController < ActionController::Base
  require 'csv'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :getnotifs, :getlastsprojects

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def getnotifs
      if user_signed_in?
        @notifications = current_user.notifications.where(read: false).order(created_at: "desc")
      end
  end

  def getlastsprojects
    @last_projects = Project.where(published: true).last(3)
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :country, :cp, :last_name, :first_name, :city, :territory_attachment, :email, :password, :password_confirmation, :remember_me, :is_registered) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
     #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def setFlashAndRedirect( msg, msgClass, url )
    flash[:notice]  = msg
    flash[:class]   = msgClass
    redirect_to url
  end

end
