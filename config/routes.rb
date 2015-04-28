Rails.application.routes.draw do
  
  # Dashboard
  root 'dashboard#front'
  get '/dashboard' => 'dashboard#dashboard'

  # Sessions
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  # Creating a new user (i.e. signup)
  get '/signup' => 'user#new'
  post '/signup' => 'user#create'

  # Showing a user
  get '/u/:name' => 'user#show', as: 'user'
  # Showing all users
  get '/leaderboard' => 'user#leaderboard'

  # Showing all problems
  get '/archive' => 'problem#archive'
  # Showing an old problem
  get '/problem/:id' => 'problem#show', as: 'problem'

  #Setting a problem
  get '/setProblem' => 'problem#new'
  post '/setProblem' => 'problem#create'

end
