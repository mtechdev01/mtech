# encoding: utf-8
class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def index
    @projects = Project.published.page(params[:page]).order('created_at DESC')
  end

  def show
    if supported?
      @supported_by_user = true
    end
    if participated?
      @user_participates = true
    end
    @project = Project.friendly.find( params[:id] )
    if !@project
      setFlashAndRedirect( "L'url appelée n'existe pas",  "danger", root_path)
    end
  end
    
  def new_support
    if !supported?
      @interaction = Interaction.new
      @interaction.role = "support"
      @interaction.user = current_user
      @interaction.project = Project.find(params[:id])
      @interaction.save
      flash[:notice]  = "Merci pour votre soutien!"
      flash[:class]   = "success"
      redirect_to :back
    else
      @project = Project.find(params[:id])
      @interaction = Interaction.where(user: current_user, project: @project, role: "support").last
      @interaction.destroy
      flash[:notice]  = "Vous ne soutenez plus ce projet."
      flash[:class]   = "danger"
      redirect_to :back
    end
  end
    
  def supported?
    @project = Project.find(params[:id])
    @interaction = Interaction.where(user: current_user, project: @project, role: "support").last
    if @interaction
      return true
    else
      return false
    end
  end
    
  def new_participation
    if !participated?
      @interaction = Interaction.new
      @interaction.role = "participation"
      @interaction.user = current_user
      @interaction.project = Project.find(params[:id])
      @interaction.save
      flash[:notice]  = "Merci pour votre participation!"
      flash[:class]   = "success"
      redirect_to :back
    else
      @project = Project.find(params[:id])
      @interaction = Interaction.where(user: current_user, project: @project, role: "participation").last
      @interaction.destroy
      flash[:notice]  = "Vous ne participez plus à ce projet."
      flash[:class]   = "danger"
      redirect_to :back
    end
  end
    
  def participated?
    @project = Project.find(params[:id])
    @interaction = Interaction.where(user: current_user, project: @project, role: "participation").last
    if @interaction
      return true
    else
      return false
    end
  end

end
