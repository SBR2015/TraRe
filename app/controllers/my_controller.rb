class MyController < ApplicationController
  # users are able to access Mypage only login
  before_filter :authenticate_user!

  def index
    @resume = Resume.all
    render :json => @resume.to_json
  end

  def info
    @user_data = {
      username: current_user.username,
      email: current_user.email
    }

    render json: @user_data
  end

 # def resume
  #  @resume = Resume.all
   # render :json => @resume.to_json
 # end

end
