class Teammates::InvitationsController < Devise::InvitationsController

  private

  # def invite_resource
  #   super do |u|
  #     u.skip_invitation = true
  #   end
  # end

  # def accept_resource
  #   resource = resource_class.accept_invitation!(update_resource_params)
  #   Analytics.report('invite.accept', resource.id)
  #   resource
  # end
end
