class ResumeController < ApplicationController
  def index
  end
  
  
  def try_resume
    @resume = Resume.all
    render :json => @resume.to_json
  end

end
