class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]
  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    if current_user.role == 'Usuario' || current_user.role == 'Editor'
      redirect_to articles_path, alert: 'No tienes permisos para crear nuevas categorias.'
    else
      @category = Category.new
    end

  end

  # GET /categories/1/edit
  def edit
    if current_user.role == 'Usuario' || current_user.role == 'Editor'
      redirect_to articles_path, alert: 'No tienes permisos para crear editar categorias.'
    else

    end
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    if current_user.role == 'Usuario' || current_user.role == 'Editor'
      redirect_to articles_path, alert: 'No tienes permisos para editar categorias.'
    else
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    if current_user.role == 'Usuario' || current_user.role == 'Editor'
      redirect_to articles_path, alert: 'No tienes permisos para eliminar categorias.'
    else
      @category.destroy

      respond_to do |format|
        format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title, :color)
    end
end
