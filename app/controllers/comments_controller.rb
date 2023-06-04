class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @article, notice: 'El comentario se creó exitosamente.'
    else
      redirect_to @article, alert: 'No se pudo crear el comentario.'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.user == current_user || current_user.admin?
      @comment.destroy
      redirect_to @article, notice: 'El comentario se eliminó exitosamente.'
    else
      redirect_to @article, alert: 'No tienes permisos para eliminar este comentario.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
