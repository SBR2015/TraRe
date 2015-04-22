class ResumesController < ApplicationController
 def index
 end

 def rj
   @resume_data = Resume.all
   render json: @resume_data
 end

end
