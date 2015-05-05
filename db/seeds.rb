# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

james = User.create(name: "james", email: "james@ox.ac.uk", password: "testtest", password_confirmation: "testtest")
User.create(:name => "rob", :email => "rob@ox.ac.uk", :password => 'testtest', :password_confirmation => 'testtest')
#users = User.create([{name: "james", password: "dai", password_confirm: "dai"},
	#{name: "robert", password: "bastian", password_confirm: "bastian"}])
#problem1 =  Problem.create([{}])

james.problems.build(title: "Functional Curried Ackermann", text: "The ackermann function is defined ack(0,y) = y+1, ack(x+1,0) = ack(x,1), ack (x+1,y+1) = ack(x, ack(x+1, y)).
	Define f such that ack_c = foldn (succ, f) is a curried version of the ackermann function, i.e. ack(x,y) = ack_c x y. Succ is the natural number successor function, and foldn (e, g) n applies g to e n times.", expiry: 1.day.from_now)