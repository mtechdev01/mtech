class Admin::ArticlesController < Admin::AdminController

  def categories
      @categories = Category.all
    end

    def index
      @articles = Article.all
    end

    def create
      @article = Article.new
      @categories = Category.all
      if request.post?
        @article = Article.new article_params
        if @article.valid?
          @article.user = current_user
          if @article.save
            flash[:notice] ="Votre article a été ajouté."
            flash[:class] ="success"
            @article= nil
            redirect_to admin_articles_path
          else
            flash[:notice] = "Une erreur est survenue lors de l'ajout de votre article"
            flash[:class] = "danger"
            redirect_to :back
          end
        else
          flash[:notice] = "Formulaire invalide"
          flash[:class]= "danger"
        end
      end
    end

    def edit
      @articles = Article.friendly.find(params[:id])
      @categories = Category.all
    end

    def update
      @article = Article.friendly.find(params[:id])
      if @article.update_attributes( article_params )
        flash[:notice] = "La mise à jour à été effectuée"
        flash[:class]= "success"
        redirect_to admin_blogs_path
      else
        flash[:notice] = "Erreur lors de la mise à jour"
        flash[:class]= "danger"
        redirect_to :back
      end
    end

    def destroy
      @article = Article.friendly.find(params[:id])
      if @article != nil
        @article.destroy
        flash[:notice] ="Cet article à été supprimé"
        flash[:class] = "success"
        redirect_to :back
      else
        flash[:notice] ="Cet article est inexistant"
        flash[:class] = "danger"
        redirect_to :back
      end
    end

    def redirecttofacebook
      @oauth = Koala::Facebook::OAuth.new(Rails.configuration.fb_id,Rails.configuration.fb_secret, fbcallback_url)
      redirect_to @oauth.url_for_oauth_code(:permissions => Rails.configuration.fb_perms, :state => params[:id])
    end

    def publishtofacebook
        @oauth = Koala::Facebook::OAuth.new(Rails.configuration.fb_id,Rails.configuration.fb_secret, fbcallback_url)
        @user_graph = Koala::Facebook::API.new(@oauth.get_access_token(session[:fb_token]))
        @page_id = Rails.configuration.fb_page_id
        @page_token = @user_graph.get_page_access_token(@page_id)
        @page_graph = Koala::Facebook::API.new(@page_token)
        @article = Article.friendly.find(params[:id])
        @page_graph.put_connections( @page_id, 'feed',  :message => @article.messageSanitized,
                                                    :name => @article.title,
                                                    :description => @article.category.name,
                                                    :picture => "http://#{request.host}:#{request.port}/#{@article.thumb}",
                                                    :link => blog_url( @article.friendly_id )
                                                    )
        flash[:notice] = "Article publié sur le mur de votre page Facebook"
        flash[:class]= "success"
        redirect_to :back
    end

    private

    def article_params
      params.require(:articles).permit(:title, :content, :user_id, :category_id, :thumb, :remove_thumb)
    end

end
