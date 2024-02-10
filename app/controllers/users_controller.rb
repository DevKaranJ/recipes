class UsersController < ApplicationController
  def index
    @users = User.where(id: current_user.id)
  end

  def destroy
    # Log out the user using Devise's sign_out method
    sign_out current_user
    # You can also redirect to a specific page after logout
    redirect_to root_path, notice: 'Logged out successfully'
  end

  def update_name
    current_user.update(name_params)
    redirect_to users_path, notice: 'Name updated successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
