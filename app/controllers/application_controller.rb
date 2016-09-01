class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_locale

  protect_from_forgery with: :exception

  def index
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  private

  def after_sign_in_path_for(resource)
    team_index_path
  end

  def after_invite_path_for(resource)
    team_index_path
  end
end
