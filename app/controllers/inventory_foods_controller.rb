class InventoryFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_inventory

  def create
    @inventory_food = @inventory.inventory_foods.build(inventory_food_params)

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
