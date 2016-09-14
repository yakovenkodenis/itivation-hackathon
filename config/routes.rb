Rails.application.routes.draw do

  namespace :admin do
    root to: 'mentors#index'

    resources :mentors
    resources :teammates
    resources :events
    resources :projects
    resources :teams

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

    devise_for :mentors,
      controllers: {
        registrations: 'mentors/registrations'
    }, path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        sign_up: 'signup'
    }

    authenticated :teammate do
      get '/', to: 'teammates/team#index'
      resources :team, controller: 'teammates/team'
      resources :projects, controller: 'teammates/projects'
    end

    authenticated :mentor do
      get '/welcome', to: 'home#welcome_mentor'
    end

    root 'home#index'

    get '/teams', to: 'home#teams'
    get '/mentors', to: 'home#mentors'
    # get '/contact', to: 'home#contact'
    get '/contact', to: 'contacts#new'
    get '/approvals', to: 'home#approvals'

    resources :contacts, only: [:new, :create]
  end

  get '(:locale)', to: 'home#index'

  get '*unmatched_route', to: 'application#raise_not_found'
end
