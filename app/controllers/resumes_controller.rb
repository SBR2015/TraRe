class ResumesController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_resume, only: [:show, :edit, :update, :destroy]

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = []
    @selected_lang_id = params[:language_id]
    if @selected_lang_id then
        resume = Resume.find_by language_id: @selected_lang_id
        if resume == nil then
          @resumes
        elsif resume.is_a?(ActiveRecord::Relation) then
          resume.map {|r| [r]}
          @resumes.concat(resume)
        else
          @resumes.push(resume)
        end
    else
        resume = Resume.all
        if resume == nil then
          @resumes
        elsif resume.is_a?(ActiveRecord::Relation) then
          resume.map {|r| [r]}
          @resumes.concat(resume)
        else
          @resumes.push(resume)
        end
    end
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
  end

  # GET /resumes/new
  def new
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  # POST /resumes.json
  def create
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
  end

end
