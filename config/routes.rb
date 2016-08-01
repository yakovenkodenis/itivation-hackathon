Rails.application.routes.draw do

  devise_for :mentors
  devise_for :teammates,
    controllers: {
      registrations: 'teammates/registrations',
      sessions: 'teammates/sessions'
  }, path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'signup'
  }

  root 'home#index'

  authenticated :teammate do
    get 'team', to: 'teammates/team#index'
  end
end
