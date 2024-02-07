class IngredientsController < ApplicationController
  before_action :set_recipe
  before_action :set_ingredient, only: [:edit, :update, :destroy]

  def new
    @ingredient = @recipe.ingredients.build
  end

  def create
    @ingredient = @recipe.ingredients.build(ingredient_params)
    if @ingredient.save
      redirect_to user_recipe_path(@recipe.user, @recipe), notice: 'Ingredient was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to user_recipe_path(@recipe.user, @recipe), notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to user_recipe_path(@recipe.user, @recipe), notice: 'Ingredient was successfully deleted.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_ingredient
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:food_name, :quantity, :value)
  end
end
