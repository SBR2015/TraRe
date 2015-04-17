class ResumeController < ApplicationController
  def index
    @resume = Resume.all
    render :json => @resume.to_json
  end
end
