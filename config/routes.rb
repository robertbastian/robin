Rails.application.routes.draw do
  
  get 'dashboard/current'

  get 'sessions/new'

  # Dashboard
  root 'dashboard#current'

  # Sessions
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  get 'logout' => 'session#destroy'

  # Showing a user
  get '/u/:name' => 'user#show'
  # Showing all users
  get '/leaderboard' => 'user#index'

  # Showing all problems
  get '/archive' => 'problem#archive'
  # Showing an old problem
  get '/problem/:id' => 'problem#show'

  #Setting a problem
  get '/setProblem' => 'problem#new'
  post '/setProblem' => 'problem#create'

end
