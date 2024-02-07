class IngredientsController < ApplicationController
  before_action :set_recipe

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


  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:food_name, :quantity, :value)
  end
end
