# encoding: utf-8
class ArticlesController  < ApplicationController

  include Likeable

  def index
    @articles = Article.published.page(params[:page]).order('created_at DESC')
  end

  def show
    @article = Article.friendly.published.find( params[:id] )
    if !@article
      setFlashAndRedirect( "L'url appelée n'existe pas",  "danger", root_path)
    end
  end

  def category
    if params[:slug]
      @category = Category.friendly.find( params[:slug] )
      if !@category
        setFlashAndRedirect( "L'url appelée n'existe pas",  "danger", root_path)
      end
    else
      setFlashAndRedirect( "L'url appelée n'existe pas",  "danger", root_path)
    end
  end

end
