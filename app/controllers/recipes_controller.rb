class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @recipes = @user.recipes
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def toggle_public
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe, notice: "Recipe visibility updated successfully"
  end
  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
