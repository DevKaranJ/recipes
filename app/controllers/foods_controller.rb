class FoodsController < ApplicationController
  before_action :authenticate_user!

  def show
    @food = current_user.foods.find(params[:id])
  end

  def index
    @foods = current_user.foods
    @user = current_user
  end

  def new
    @food = current_user.foods.build
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to user_foods_path(current_user), notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
