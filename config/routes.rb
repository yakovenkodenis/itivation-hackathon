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

  get '/teams', to: 'home#teams'
  get '/about', to: 'home#about'
  get '/mentors', to: 'home#mentors'
  get '/contact', to: 'home#contact'

  authenticated :teammate do
    resources :team, controller: 'teammates/team'
    resources :project, controller: 'teammates/projects'
  end
end
