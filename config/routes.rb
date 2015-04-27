Rails.application.routes.draw do
  
  # Dashboard
  root 'dashboard#front'

  # Sessions
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  get 'logout' => 'session#destroy'

  # Showing a user
  get '/u/:name' => 'user#show', as: 'user'
  get '/profile' => 'user#profile'
  # Showing all users
  get '/leaderboard' => 'user#leaderboard'

  # Showing all problems
  get '/archive' => 'problem#archive'
  # Showing an old problem
  get '/problem/:id' => 'problem#show'

  #Setting a problem
  get '/setProblem' => 'problem#new'
  post '/setProblem' => 'problem#create'

end
