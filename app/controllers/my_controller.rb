class MyController < ApplicationController
  # users are able to access Mypage only login
  before_filter :authenticate_user!

  def index
    @my_resumes = Resume.where(owner_id: current_user.id).order(:created_at).reverse_order

  end

  def info
    @user_data = {
      username: current_user.username,
      email: current_user.email
    }

    render json: @user_data
  end

end
