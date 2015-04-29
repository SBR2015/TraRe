class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :setuser

  def show
  end

  private

  def setuser
    @user = User.find_by(username: params[:username])
    render text: 'the user doesn\'t exist.', status: 404 if @user.nil?
  end
end
