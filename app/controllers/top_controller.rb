class TopController < ApplicationController
  before_filter :authenticate_user!

  def index
    @resumes = params[:language_id].present? ? Resume.where(language_id: params[:language_id]) : Resume.all
    @current_user = current_user
    @users = User.all
  end
end
