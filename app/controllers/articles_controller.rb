class ArticlesController < ApplicationController
  before_action :find_article, only: %i[edit update show destroy]
  before_action :authenticate_user!, only: %i[new edit update create destroy]
  def index
    @articles = Article.all
  end

  def show; end

  def edit
    unless @article.user == current_user || current_user.admin?
      redirect_to articles_path, alert: 'No tienes permiso para editar este artículo.'
    end
    @categories = Category.all
  end

  def update
    unless @article.user == current_user || current_user.admin?
      redirect_to articles_path, alert: 'No tienes permiso para editar este artículo.'
      return
    end
    @article.update(article_params)
    @article.save_categories
    redirect_to article_path
  end

  def new
    if current_user.role == 'Usuario'
      redirect_to articles_path, alert: 'No tienes permisos para crear nuevos artículos.'
    else
      @article = Article.new
      @categories = Category.all
    end
  end

  def create
    @article = current_user.articles.create(article_params)
    @article.save_categories
    redirect_to @article
  end

  def destroy
    unless @article.user == current_user || current_user.admin?
      redirect_to articles_path, alert: 'No tienes permiso para editar este artículo.'
      return
    end
    @article.remove_category_association
    @article.destroy
    redirect_to root_path
  end

  def from_author
    @user = User.find(params[:user_id])
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, category_elements: [])
  end
end
