class HomeController < ApplicationController
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authorize_admin, only: :approvals

  helper_method :resource_name, :resource, :devise_mapping

  def index
    @mentors = Mentor.all
    @mentors_count = @mentors.size
  end

  def teams
    @teams = Team.all
  end

  def mentors
    redirect_to welcome_path if current_mentor
    @mentors = Mentor.all
  end

  def approvals
    if params[:approved] == "false"
      @mentors = Mentor.where(approved: false)
    else
      @mentors = Mentor.all
    end
  end

  def welcome_mentor
    redirect_to root_path if !current_mentor
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

  def authorize_admin
    redirect_to :back, status: 401 unless current_teammate.admin
  end
end
