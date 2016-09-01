class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_locale

  # rescue_from ActiveRecord::RecordNotFound, with: :not_found
  # rescue_from Exception, with: :not_found
  # rescue_from ActionController::RoutingError, with: :not_found

  protect_from_forgery with: :exception

  def index
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  # protected

  # def raise_not_found
  #   raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  # end

  # def not_found
  #   respond_to do |format|
  #     format.html { redirect_to root_path, notice: 'Wrong url' }
  #   end
  # end

  # def error
  #   respond_to do |format|
  #     format.html { redirect_to root_path, notice: 'Wrong url' }
  #   end
  # end

  private

  def after_sign_in_path_for(resource)
    team_index_path
  end

  def after_invite_path_for(resource)
    team_index_path
  end
end
