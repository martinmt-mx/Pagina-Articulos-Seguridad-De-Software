class UsersController < ApplicationController
  before_action :authenticate_user!

    # def index
    #   @current_user = current_user.scoped
    # end

    # def show
    #   @current_user = current_user.find(params[:id])
    # end

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

    # def destroy
    #   current_user = current_user.find(params[:id])
    # end

    def user_params
      params.require(:user).permit(:avatar)
    end

end
