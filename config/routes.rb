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
        invitations:   'teammates/invitations'
    }, path_names: {
        sign_in:  'login',
        sign_out: 'logout',
        sign_up:  'signup'
    }

    devise_for :mentors,
      controllers: {
        registrations: 'mentors/registrations'
    }, path_names: {
        sign_in:  'login',
        sign_out: 'logout',
        sign_up:  'signup'
    }

    authenticated :mentor do
      get '/', to: 'mentors/mentor#index'
    end

    authenticated :teammate do
      get '/', to: 'teammates/team#index'
      resources :team,     controller: 'teammates/team'
      resources :projects, controller: 'teammates/projects'
    end

    root 'home#index'

    get '/teams',     to: 'home#teams'
    get '/mentors',   to: 'home#mentors'
    get '/approvals', to: 'home#approvals'

    get '/contact', to: 'contacts#new'

    resources :contacts, only: [:new, :create]
  end

  get '(:locale)', to: 'home#index'

  get '*unmatched_route', to: 'application#raise_not_found'
end
