class ProblemController < ApplicationController

	def archive
		@problems = Problem.all
	end

	def show
		@problem = Problem.find(params[:id])
	end
end
