class TopController < ApplicationController
  def index
    redirect_to user_path(username: current_user.username) if user_signed_in?
  end
end
