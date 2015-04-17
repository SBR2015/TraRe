#curd?
class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  def index
    @resumes = Resume.all
  end

  def show
  end

  def new
    @resumes = Resume.new
    render :json => {:form => render_to_string(:partial => 'form')}
  end

  def edit
  end

  def create
    @resumes = Resume.new(resume_params)

    respond_to do |format|
      if @resumes.save
        format.html { redirect_to @resumes, notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resumes }
      else
        format.html { render :new }
        format.json { render json: @resumes.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resumes.update(resume_params)
        format.html { redirect_to @resumes, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resumes }
      else
        format.html { render :edit }
        format.json { render json: @resumes.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @resumes.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_resume
      @resumes = Resume.find(params[:id])
    end

    def resume_params
      params.require(:resume).permit(:title, :description)
    end
end
