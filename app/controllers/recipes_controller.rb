class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @recipes = @user.recipes
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
    @recipe = Recipe.includes(:ingredients).find(params[:id])
  end

  def toggle_public
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe, notice: 'Recipe visibility updated successfully'
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to user_recipe_path(@user, @recipe), notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to user_recipes_path(@user), notice: 'Recipe was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
