Rails.application.routes.draw do

  root 'dashboard#front'
  get '/dashboard' => 'dashboard#dashboard'
  get '/leaderboard' => 'users#leaderboard'

  get '/u/:name' => 'users#show', as: :user
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  # TODO: Shouldn't really be able to logout with a GET
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  # Routes like:
  # /problems
  # /problems/:id
  # /problems/:problem_id/solutions
  # Run 'bin/rake routes' for details
  resources :problems, only: [:index, :new, :create, :show] do
    resources :solutions, only: [:index, :new, :create]
  end
  # Don't nest this one, because that would be overkill
  resources :solutions, only: [:show]

end
