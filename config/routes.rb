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

  # Solutions
  get 'problem/:id/solutions' => 'solution#forProblem'
  get 'solution/:id' => 'solution#show', as: 'solution'

  # Setting a problem
  get '/setProblem' => 'problem#new'
  post '/setProblem' => 'problem#create'

  # Solving a problem
  # These "as"s are a mess... (they're used to generate the html forms correctly)
  get '/problem/:problem_id/solve' => 'solution#new', as: 'solutions'
  post '/problem/:problem_id/solve' => 'solution#create'

end
