class Admin::CategoriesController < Admin::AdminController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def update
    @category = Category.friendly.find(params[:id])
    if @category.update_attributes(article_params)
      flash[:notice] = "La mise à jour à été effectuée"
      flash[:class]= "success"
      redirect_to admin_categories_path
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    if request.post?
      @category = Category.new category_params
      if @category.valid?
        if @category.save
          flash[:notice] ="Votre catégorie a été ajouté."
          flash[:class] ="success"
          @category = nil
          redirect_to admin_categories_path
        else
          flash[:notice] = "Une erreur est survenue lors de l'ajout de votre catégorie"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "Formulaire invalide"
        flash[:class]= "danger"
      end
    end
  end

  def destroy
    @category = Category.friendly.find(params[:id])
    @category.destroy
    flash[:notice] = "Suppression de la catégorie enregistré"
    flash[:class] = "success"
    redirect_to :back
  end

  private

  def category_params
    params.require(:category).permit(:id, :name, :icon, :color)
  end

end
