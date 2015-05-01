require 'test_helper'

class SolutionTest < ActiveSupport::TestCase
  test "solution is valid" do
	assert solutions(:fredSolution1).valid? "This solution should be vaid"
  end
end
