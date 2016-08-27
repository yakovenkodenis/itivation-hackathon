Rails.application.routes.draw do

  get '(:locale)', to: 'home#index'

  namespace :admin do
    resources :mentors
    resources :teammates
    resources :events
    resources :projects
    resources :teams

    root to: 'mentors#index'
  end

  scope '(:locale)', locale: /en|ru/ do

    devise_for :teammates,
      controllers: {
        registrations: 'teammates/registrations',
        invitations: 'teammates/invitations'
    }, path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        sign_up: 'signup'
    }

    devise_for :mentors

    root 'home#index'

    get '/teams', to: 'home#teams'
    get '/mentors', to: 'home#mentors'
    get '/contact', to: 'home#contact'

    authenticated :teammate do
      resources :team, controller: 'teammates/team'
      resources :project, controller: 'teammates/projects'
    end
  end
end
