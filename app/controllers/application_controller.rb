class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  # device controller calls below methods
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # sign_in allows email
    devise_parameter_sanitizer.for(:sign_in) << :email
    # sign_up allows email
    devise_parameter_sanitizer.for(:sign_up) << :email
    # account_update allows email
    devise_parameter_sanitizer.for(:account_update) << :email
  end

  # devise path settings after login
  def after_sign_in_path_for(resource)
    '/user/' + current_user.username
  end

  # devise path settings after logout
  def after_sign_out_path_for(resource)
    '/'
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @localeinfo = {}
    I18n.available_locales.each do |locale|
      @localeinfo[locale] = locale.to_s
    end
  end

  def default_url_options(options={})
    locale = I18n.locale unless I18n.locale == :en
    options.merge locale: locale
  end
end
