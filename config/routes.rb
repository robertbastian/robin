Rails.application.routes.draw do

  root 'dashboard#front'
  get '/dashboard' => 'dashboard#dashboard'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create]

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
