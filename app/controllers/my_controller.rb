class MyController < ApplicationController
  # users are able to access Mypage only login
  before_filter :authenticate_user!

  def index
  end
end
