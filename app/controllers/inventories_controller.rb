class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_inventory, only: %i[show destroy]
  before_action :initialize_inventory_food, only: [:show]

  # GET /users/:user_id/inventories
  def index
    @inventories = @user.inventories
  end

  def show
    @user = User.find(params[:user_id])
    @inventory = @user.inventories.find(params[:id])
    @inventory_food = @inventory.inventory_foods.new
  end

  # GET /users/:user_id/inventories/new
  def new
    @inventory = @user.inventories.build
  end

  # POST /users/:user_id/inventories
  def create
    @inventory = @user.inventories.build(inventory_params)
    if @inventory.save
      redirect_to user_inventories_path(@user), notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  # DELETE /users/:user_id/inventories/:id
  def destroy
    @inventory.destroy
    redirect_to user_inventories_path(@user), notice: 'Inventory was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_inventory
    @inventory = @user.inventories.find(params[:id])
  end

  def initialize_inventory_food
    @inventory_food = nil
  end

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
