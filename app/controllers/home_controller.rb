class HomeController < ApplicationController
  def index
    if user_signed_in? && !request.path.starts_with?("/users/sign_out")
      redirect_to users_path
    else
      @welcome_message = "Welcome to the Recipe App!"
    end

  end
end
