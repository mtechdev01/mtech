# encoding: utf-8
class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  include Likeable

  def index
    @projects = Project.published.page(params[:page]).order('created_at DESC')
  end

  def show
    @project = Project.friendly.find( params[:id] )
    if !@project
      setFlashAndRedirect( "L'url appelée n'existe pas",  "danger", root_path)
    end
  end

end
