require "administrate/base_dashboard"

class MentorDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    invited_by: Field::Polymorphic,
    id: Field::Number,
    name: Field::String,
    email: Field::String,
    description: Field::Text,
    organization: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    unconfirmed_email: Field::String,
    failed_attempts: Field::Number,
    unlock_token: Field::String,
    locked_at: Field::DateTime,
    invitation_token: Field::String,
    invitation_created_at: Field::DateTime,
    invitation_sent_at: Field::DateTime,
    invitation_accepted_at: Field::DateTime,
    invitation_limit: Field::Number,
    invitations_count: Field::Number,
    avatar_file_name: Field::String,
    avatar_content_type: Field::String,
    avatar_file_size: Field::Number,
    avatar_updated_at: Field::DateTime,
    city: Field::String,
    approved: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :invited_by,
    :id,
    :name,
    :email,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :invited_by,
    :id,
    :name,
    :email,
    :description,
    :organization,
    # :created_at,
    # :updated_at,
    # :encrypted_password,
    # :reset_password_token,
    # :reset_password_sent_at,
    # :remember_created_at,
    # :sign_in_count,
    # :current_sign_in_at,
    # :last_sign_in_at,
    # :current_sign_in_ip,
    # :last_sign_in_ip,
    # :confirmation_token,
    # :confirmed_at,
    # :confirmation_sent_at,
    # :unconfirmed_email,
    # :failed_attempts,
    # :unlock_token,
    # :locked_at,
    # :invitation_token,
    # :invitation_created_at,
    # :invitation_sent_at,
    # :invitation_accepted_at,
    # :invitation_limit,
    # :invitations_count,
    # :avatar_file_name,
    # :avatar_content_type,
    # :avatar_file_size,
    # :avatar_updated_at,
    :city,
    :approved,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :invited_by,
    :name,
    :email,
    :description,
    :organization,
    :encrypted_password,
    # :reset_password_token,
    # :reset_password_sent_at,
    # :remember_created_at,
    # :sign_in_count,
    # :current_sign_in_at,
    # :last_sign_in_at,
    # :current_sign_in_ip,
    # :last_sign_in_ip,
    # :confirmation_token,
    # :confirmed_at,
    # :confirmation_sent_at,
    # :unconfirmed_email,
    # :failed_attempts,
    # :unlock_token,
    # :locked_at,
    # :invitation_token,
    # :invitation_created_at,
    # :invitation_sent_at,
    # :invitation_accepted_at,
    # :invitation_limit,
    # :invitations_count,
    # :avatar_file_name,
    # :avatar_content_type,
    # :avatar_file_size,
    # :avatar_updated_at,
    :city,
    :approved,
  ].freeze

  # Overwrite this method to customize how mentors are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(mentor)
    "#{mentor.name}"
  end
end
