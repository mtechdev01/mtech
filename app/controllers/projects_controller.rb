# encoding: utf-8
class ProjectsController < ApplicationController
    before_action :authenticate_user!


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

  def new
    @project = Project.new
    @categories = Category.all
  end

  def create
    @project = Project.new
    @categories = Category.all
    if request.post?
      @project = Project.new project_params
      if @project.valid?
        @project.owner = current_user
        if @project.save
          Notification.notify("Nouveau Projet", @project.id, "Project", User.where(is_admin: true), current_user.id)
          flash[:notice] ="Votre projet a été ajouté."
          flash[:class] ="success"
          redirect_to project_path(@project.id)
        else
          flash[:notice] = "Une erreur est survenue lors de l'ajout de votre projet"
          flash[:class] = "danger"
          redirect_to projects_path
        end
      else
        flash[:notice] = "Formulaire invalide"
        flash[:class]= "danger"
        redirect_to new_project_path
      end
    end
  end

  def edit
    @project = Project.friendly.find(params[:id])
    @categories = Category.all
  end

  def update
    @project = Project.friendly.find(params[:id])
    if @project.update_attributes(project_params)
      Notification.notify("Edition de Projet", @project.id, "Project", User.where(is_admin: true), current_user.id)
      flash[:notice] = "La mise à jour a été effectuée"
      flash[:class]= "success"
      redirect_to project_url(@project.id)
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  def destroy
    @project = Project.friendly.find(params[:id])
    if @project != nil
      Notification.notify("Suppression de Projet", @project.id, @project.name, notification_receivers, current_user.id)
      @project.destroy
      flash[:notice] ="Ce projet a été supprimé"
      flash[:class] = "success"
      redirect_to :back
    else
      flash[:notice] ="Ce projet est inexistant"
      flash[:class] = "danger"
      redirect_to :back
    end
  end

  def new_support
    if !supported?
      @interaction = Interaction.new
      @interaction.role = "support"
      @interaction.user = current_user
      @interaction.project = Project.find(params[:id])
      @interaction.save
      if @interaction.user != @interaction.project.owner
        Notification.notify("Nouveau Soutien", @interaction.project.id, "Project", @interaction.project.owner, current_user.id)
      end
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
      if @interaction.user != @interaction.project.onwer
        Notification.notify("Nouveau Participant", @interaction.project.id, "Project", @interaction.project.owner, current_user.id)
      end

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

  private    
    
  def project_params
    params.require(:project).permit(:name, :content, :category_id, :thumb, :location, :state)
  end
     
  def notification_receivers
    @receivers = []
    User.where(is_admin: true).each do |admin|
      @receivers.push(admin) #ADMINS
    end
    @project.interactions.each do |interaction|
      if !@receivers.include?(interaction.user)
        @receivers.push(interaction.user) #INTERAGISSANTS
      end
    end
    return @receivers
  end

end
