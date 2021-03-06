require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
	test "problem is valid" do
		assert problems(:problem1).valid? "Problem1 is not valid"
	end
  
	test "winner is not the same as setter" do
		assert problems(:problem1).valid? "Problem1 is not valid - test inconclusive"
		problems(:problem1).winner = problems(:problem1).author
		assert_not problems(:problem1).valid? "The setter cannot be the same as the winner"
		# This validation has not yet been implemented
	end
end
