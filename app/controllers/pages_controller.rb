# encoding: utf-8
class PagesController < ApplicationController

  def home
    @most_active_projects = Project.mostActive
  end

  def about
  end

  def legals
  end

  def callback
    @state = params[:state].split(',')
    session[:fb_token] = params[:code]
    redirect_to admin_PublishtoFacebook_url @state[0]
  end

end
