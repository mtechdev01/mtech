# encoding: utf-8
class PagesController < ApplicationController

  def home
    @session = session
    @most_active_projects = Project.mostActive
    @last_projects = Project.lasts
  end

  def about
  end

  def callback
    @state = params[:state].split(',')
    session[:fb_token] = params[:code]
    redirect_to admin_PublishtoFacebook_url @state[0]
  end

end
