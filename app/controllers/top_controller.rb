class TopController < ApplicationController
  before_filter :authenticate_user!

  def index
    lang = params[:language]
    @resumes = Resume.where.not(owner_id: current_user.id)
    @resumes = @resumes.where(language_id: lang) if lang.present?
    @selected_lang = lang || 1
  end
end
