require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid" do
	assert users(:david).valid? "User should be valid"
  end
end
