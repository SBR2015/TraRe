class TopController < ApplicationController
  before_filter :authenticate_user!

  def index
    lang = params[:language].blank? ? {} : params[:language]
    @resumes = lang.blank? ? 
        Resume.where.not(owner_id: current_user.id) :
        Resume.where(language_id: lang[:id]).where.not(owner_id: current_user.id)
    @selected_lang = lang[:id]
  end
end
