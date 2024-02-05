class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    @user.foods.create(name: 'Apple', deleted: false)
    @user.foods.create(name: 'Pineapple', deleted: false)
    @user.foods.create(name: 'Chicken breats', deleted: false)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
