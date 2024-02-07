# app/controllers/public_recipes_controller.rb
class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
