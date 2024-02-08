class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory, only: [:new, :create]

  def new
    @food = @inventory.foods.build
  end

  def create
    @food = @inventory.foods.build(food_params)
    if @food.save
      redirect_to inventory_path(@inventory), notice: 'Food was successfully added to inventory.'
    else
      render :new
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
