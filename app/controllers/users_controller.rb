class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :setuser

  def show
  end

  private

  def setuser
    @user = User.find_by(username: params[:username])
    if @user
      @theirtranslations = Resume.where(translator_id: @user.id, is_translation: true)
      @theirtranslateds = Resume.where(owner_id: @user.id, is_translation: true)
      @resumes = Resume.where(owner_id: @user.id, is_translation: false)
    else
      render text: 'the user doesn\'t exist.', status: 404 if @user.nil?
    end
  end
end
