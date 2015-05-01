class TopController < ApplicationController
  before_filter :authenticate_user!

  def index
    # owner_id != 自分のid のデータのみ抽出して、Resume.owner_idとUsers.nameを紐付ける。JOINでデータ取った方が早いかも。
    @resumes = params[:language_id].present? ? Resume.where(language_id: params[:language_id]) : Resume.all
  end
end
