class HomeController < ApplicationController
  def index
    if user_signed_in? && !request.path.starts_with?("/users/sign_out")
      redirect_to users_path
    else
      # Render welcome content
    end

  end
end
