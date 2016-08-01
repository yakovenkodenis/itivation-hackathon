class Teammates::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :email, :password, :city]
    )
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update, keys: [:name, :email, :password, :city]
    )
  end

  def after_sign_up_path_for(resource)
    '/team'
  end
end
