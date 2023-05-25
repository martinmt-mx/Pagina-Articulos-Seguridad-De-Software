class UsersController < ApplicationController
  before_action :authenticate_user!

    # def index
    #   @current_user = current_user.scoped
    # end

    # def show
    #   user = User.find_by(id: params[:id])

    #   if user.nil?
    #     # Redirige o maneja el caso en el que el usuario no exista
    #     redirect_to root_path, notice: 'El usuario no existe'
    #   end
    # end

    def my_comments
      @user = current_user
      @comments = @user.comments
    end

    def my_articles
      @user = current_user
      @articles = @user.articles
    end


    # def create
    #   @current_user = current_user.new(params[:current_user])
    # end

    def update
      current_user.update(user_params)
      redirect_back(fallback_location: root_path)
    end

    def edit
      # current_user = current_user.find(params[:id])
    end

    def destroy
      user = User.find(params[:id])
      user.articles.update_all(user_id: 16)
      user.destroy
      reset_session # Opcional: Cierra la sesión del usuario eliminado
      redirect_to root_path, notice: "Tu cuenta ha sido eliminada correctamente."
    end

    def user_params
      params.require(:user).permit(:name, :avatar)
    end

end
