class InventoryFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_inventory

  def create
    food_name = inventory_food_params[:food_name]
    quantity = inventory_food_params[:quantity]

    # Find or create the Food record based on the provided food_name
    food = Food.find_or_create_by(name: food_name)

    # Create the InventoryFood record with the correct food_id
    @inventory_food = @inventory.inventory_foods.build(food_id: food.id, quantity: quantity)

    if @inventory_food.save
      redirect_to user_inventory_path(@user, @inventory), notice: 'Food was successfully added to the inventory.'
    else
      render 'inventories/show'
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
