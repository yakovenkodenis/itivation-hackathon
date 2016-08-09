Rails.application.routes.draw do

  devise_for :mentors

  devise_for :teammates,
    controllers: {
      registrations: 'teammates/registrations',
      invitations: 'teammates/invitations'
  }, path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'signup'
  }

  root 'home#index'

  authenticated :teammate do
    resources :team, controller: 'teammates/team'
  end
end
