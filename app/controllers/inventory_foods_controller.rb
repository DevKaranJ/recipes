class InventoryFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_inventory

  def new
    @inventory_food = @inventory.inventory_foods.new
    render 'add_food'
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.build
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @user = @inventory.user
    food_name = params[:inventory_food][:food_name]
    quantity = params[:inventory_food][:quantity]

    # find or create a Food object with the given food_name
    food = @user.foods.find_by(name: food_name) || @user.foods.create(name: food_name)

    @inventory_food = @inventory.inventory_foods.new(food:, quantity:)

    respond_to do |format|
      if @inventory_food.save
        format.html { redirect_to [@user, @inventory], notice: 'Food was successfully added to inventory.' }
        format.json { render :show, status: :created, location: @inventory_food }
      else
        format.html { render :new }
        format.json { render json: @inventory_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory_food = @inventory.inventory_foods.find(params[:id])
    @inventory_food.destroy
    respond_to do |format|
      format.html do
        redirect_to user_inventory_path(@user, @inventory), notice: 'Food was successfully removed from inventory.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_inventory
    @inventory = @user.inventories.find(params[:inventory_id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:food_name, :quantity)
  end
end
