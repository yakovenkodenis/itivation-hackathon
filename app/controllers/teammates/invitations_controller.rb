class Teammates::InvitationsController < Devise::InvitationsController

  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:name, :city, :email, :password,
               :password_confirmation, :invitation_token)
    end
  end

  private

  def invite_resource
    super do |u|
      u.team = current_teammate.team
    end
  end

  # def accept_resource
  #   resource = resource_class.accept_invitation!(update_resource_params)
  #   Analytics.report('invite.accept', resource.id)
  #   resource
  # end
end
