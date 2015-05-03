require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@robin = User.new(name: "Rob", email: "Rob@robmail.com",
		                  password: "robinius")
		@fred = User.new(name: "Fred", email: "freddie@fredmail.com",
		                 password: "short")
	end

	test "user is valid" do
		assert @robin.valid?
	end

	test "password should have a minimum length" do
		assert_not @fred.valid?
	end
end
