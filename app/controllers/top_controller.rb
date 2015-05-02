class TopController < ApplicationController
  before_filter :authenticate_user!

  def index
    lang = params[:language].blank? ? [] : params[:language]
    resumes = lang.blank? ? Resume.all : Resume.where(language_id: lang[:id])
    @selected_lang = lang[:id]

    @user_list = []
    resumes.each do | resume |
      if current_user.id != resume.owner_id
        User.all.each do | user |
          if user.id == resume.owner_id
            @user_list.push user
          end
        end
      end
    end
  end
end
