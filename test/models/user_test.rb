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
	
	test "emails are valid" do
	        assert @robin.valid? "Initial test user not valid, inconclusive"
	        @robin.email = "   "
	        assert_not @robin.valid? "email should be invalid 1"
   	        @robin.email = "invalid"
	        assert_not @robin.valid? "email should be invalid 2"
   	        @robin.email = "inv@lid"
	        assert_not @robin.valid? "email should be invalid 3"
   	        @robin.email = "@invalid"
	        assert_not @robin.valid? "email should be invalid 4"
   	        @robin.email = "@inval.id"
	        assert_not @robin.valid? "email should be invalid 5"
   	        @robin.email = "invalid@"
	        assert_not @robin.valid? "email should be invalid 6"
   	        @robin.email = "inv@.lid"
	        assert_not @robin.valid? "email should be invalid 7"
   	        @robin.email = "inv@lid."
	        assert_not @robin.valid? "email should be invalid 8"	        
   	        @robin.email = "i.nv@lid"
	        assert_not @robin.valid? "email should be invalid 9"	        
   	        @robin.email = "i@nv@li.d"
	        assert_not @robin.valid? "email should be invalid 10"
   	        @robin.email = "i.nv@l.id"
	        assert_not @robin.valid? "email should be invalid 11"
   	        @robin.email = "a" *244 +"@invalid.com"
	        assert_not @robin.valid? "email is too long"
	end
end
