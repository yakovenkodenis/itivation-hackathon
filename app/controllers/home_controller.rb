class HomeController < ApplicationController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :resource_name, :resource, :devise_mapping

  def index
    @mentors = Mentor.all
    @mentors_count = @mentors.size
  end

  def teams
    @teams = Team.all
  end

  def mentors
    @mentors = Mentor.all
  end

  def resource_name
    :mentor
  end

  def resource
    @resource ||= Mentor.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:mentor]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :email, :password, :city,
                       :avatar, :description, :organization]
    )
  end
end
