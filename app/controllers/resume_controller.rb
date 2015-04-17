class ResumeController < ApplicationController
  def resume
    @resume = Resume.all
    render :json => @resume.to_json
  end
end
