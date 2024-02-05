class FoodsController < ApplicationController
  def destroy
    @food = Food.find(params[:id])
    @food.update(deleted: true)
    redirect_to foods_url
  end
end
