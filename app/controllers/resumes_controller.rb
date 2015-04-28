class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  before_action :set_param_user, only: [:edit, :update, :destroy, :new, :create, :index]
  before_action :set_param_language, only: [:new, :edit]

  # GET /user/:user_username/resumes
  # GET /user/:user_username/resumes.json
  def index
    @resumes = Resume.where(owner_id: @user.id).order(:created_at)
  end

  # GET /user/:user_username/resumes/1
  # GET /user/:user_username/resumes/1.json
  def show
  end

  # GET /user/:user_username/resumes/new
  def new
    @resume = Resume.new
  end

  # GET /user/:user_username/resumes/1/edit
  def edit
  end

  # POST /user/:user_username/resumes
  # POST /user/:user_username/resumes.json
  def create
    @resume = Resume.new(resume_params)

    # set resume params
    @resume.owner_id = @user.id
    @resume.translator_id = current_user.id
    @resume.is_translation = @user.id == current_user.id ? false : true

      respond_to do |format|
      if @resume.save
        # format.html { redirect_to '/' + owner_name, notice: 'Resume was successfully created.'  }
        format.html { redirect_to user_resumes_path, notice: 'Resume was successfully created.'  }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/:user_username/resumes/1
  # PATCH/PUT /user/:user_username/resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to user_resumes_path, notice: 'Resume was successfully updated.' }
        # format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/:user_username/resumes/1
  # DELETE /user/:user_username/resumes/1.json
  def destroy

    if @resume.is_translation
      @resume.destroy
    else
      delete_resume = Resume.where(owner_id: @resume.owner_id)
      delete_resume.destroy_all
    end

    respond_to do |format|
      format.html { redirect_to user_resumes_path, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:sentence, :is_translation, :owner_id, :translator_id, :language_id)
    end

    # Set username(/user/:user_username)
    def set_param_user
      @user = User.find_by(username: params[:user_username])
    end

    # set language
    def set_param_language
      @language = Language.all.pluck :code, :id

      # URLのユーザーが自分自身だった場合、全て選択出来る。
      return @language if current_user.username == params[:user_username]

      # URLのユーザーのidを取得
      url_user_id = User.find_by(username: params[:user_username]).id

      # 他ユーザーへの翻訳レジュメを作成するとき、オリジナルレジュメで書かれている言語を除外する。
      original_resume_language_id = Resume.where(owner_id: url_user_id).where(is_translation: false).pluck :language_id
      original_resume_language = Language.where(id: original_resume_language_id).pluck :code, :id
      @language -= original_resume_language

      return @language
    end

end
