class Mentors::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :email, :password, :city,
                       :avatar, :description, :organization,
                       :approved]
    )
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :email, :password, :city,
                       :avatar, :description, :organization,
                       (:approved if current_teammate && current_teammate.admin)]
    )
  end

  def after_sign_up_path_for(resource)
    welcome_path
  end

  def after_inactive_sign_up_path_for(resource)
    welcome_path
  end

  def after_update_path_for(resource)
    root_path
  end
end
