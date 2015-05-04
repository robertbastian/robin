class ProblemsController < ApplicationController

    def index
        @problems = Problem.all
    end

    def show
        @problem = Problem.find(params[:id])
        @solutions = @problem.solutions
    end

    def new
        @mrp = most_recent_problem
        if !@mrp || (@mrp.winner && @mrp.winner == current_user && !active_problem?)
            @problem = Problem.new
        else
            flash[:danger] = 'That\'s just not allowed'
            if !@mrp.winner flash[:danger] = "Last problem doesn't have a winner yet"
            else flash[:danger] = 'You\'re not the winner of the last problem'
            end
            redirect_to root_url
        end
    end

    def edit
        session[:return_to] ||= request.referer
        @problem = Problem.find(params[:id])
        if (current_user.id != @problem.user_id)
            flash[:danger] = "You are not the problem's writer"
            redirect_to session.delete(:return_to)
        end
        @solutions = @problem.solutions
    end

    def create
        # Only the last winner can create a problem
        @problem = current_user.problems.build(problem_params)
        @problem.expiry = (params.permit(:expiry)[:expiry].to_i.seconds || 3.days).from_now
        @problem.text = HTTParty.post('https://api.github.com/markdown', :body => { :text => @problem.text }.to_json, :headers => { 'Content-Type' => 'application/json', 'User-Agent' => 'robertbastian/robin' }).parsed_response
        if @problem.save
        # save returns a boolean that is true if problem is valid
            redirect_to root_url
        else
            flash[:danger] = @problem.errors.full_messages.first
            render 'new'
        end
    end

    def update
        @problem = Problem.find(params[:id])
        @winner = Solution.find(params.require(:winning_solution_id).to_i).user
        if @problem.update(winner_id: @winner.id) and @winner.increment!(:score)
            redirect_to @problem
        else
            render 'edit'
        end
    end

    private
    def problem_params
        params.require(:problem).permit(:title, :text)
    end
end
