class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    # Log out the user using Devise's sign_out method
    sign_out current_user
    # You can also redirect to a specific page after logout
    redirect_to root_path, notice: "Logged out successfully"
  end
end
