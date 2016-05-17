class Admin::ProjectsController < Admin::AdminController
  before_action :authenticate_user!, only: [:create]

  def index
    @categories = Category.name
    @projects = Project.all
  end

  def edit
    @project = Project.friendly.find(params[:id])
    @categories = Category.all
  end

  def update
    @project = Project.friendly.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:notice] = "La mise à jour à été effectuée"
      flash[:class]= "success"
      redirect_to admin_projects_url
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end



  def destroy
    @project = Project.friendly.find(params[:id])
    if @project != nil
      @project.destroy
      flash[:notice] ="Ce projet à été supprimé"
      flash[:class] = "success"
      redirect_to :back
    else
      flash[:notice] ="Ce projet est inexistant"
      flash[:class] = "danger"
      redirect_to :back
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
          flash[:notice] ="Votre projet a été ajouté."
          flash[:class] ="success"
          redirect_to :back
        else
          flash[:notice] = "Une erreur est survenue lors de l'ajout de votre projet"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "Formulaire invalide"
        flash[:class]= "danger"
      end
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :content, :category_id, :thumb, :location, :state)
  end

end
