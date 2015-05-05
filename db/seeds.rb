# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

james = User.create(name: "james", email: "james@ox.ac.uk", password: "testtest", password_confirmation: "testtest")
aiken = User.create(name: "aiken", email: "aiken@ox.ac.uk", password: "testtest", password_confirmation: "testtest")
rob = User.create(name: "rob", email: "rob@ox.ac.uk", password: "testtest", password_confirmation: "testtest")
paavan = User.create(name: "paavan", email: "paavan@ox.ac.uk", password: "testtest", password_confirmation: "testtest")
alistair = User.create(name: "alistair", email: "alistair@ox.ac.uk", password: "testtest", password_confirmation: "testtest")

#james.problems.build(title: "Functional Curried Ackermann", text: "The ackermann function is defined ack(0,y) = y+1, ack(x+1,0) = ack(x,1), ack (x+1,y+1) = ack(x, ack(x+1, y)).
	#Define f such that ack_c = foldn (succ, f) is a curried version of the ackermann function, i.e. ack(x,y) = ack_c x y. Succ is the natural number successor function, and foldn (e, g) n applies g to e n times.", expiry: 1.day.from_now)
ack = Problem.create(title: "Functional Curried Ackermann",
	text: "The ackermann function is defined ack(0,y) = y+1, ack(x+1,0) = ack(x,1), ack (x+1,y+1) = ack(x, ack(x+1, y)).
	Define f such that ack_c = foldn (succ, f) is a curried version of the ackermann function, i.e. ack(x,y) = ack_c x y. Succ is the natural number successor function, and foldn (e, g) n applies g to e n times.",
	expiry: 4.days.ago,
	user_id: james.id,
	created_at: 5.days.ago,
	updated_at: 5.days.ago)


Solution.create(
	text: "f g = foldn (g 1, g)
	-- ack_c x gives a function from Nat -> Nat.
	-- ack_c 0 gives succ,
	-- ack_c 1 gives f succ,
	-- and so on.",
	user_id: aiken.id,
	problem_id: ack.id,
	created_at: (5.days - 4.hours).ago,
	updated_at: (5.days - 4.hours).ago,
	title: "",
	language: "Haskell")

Solution.create(
	text: "What is this I don't even",
	user_id: rob.id,
	problem_id: ack.id,
	created_at: (5.days - 6.hours).ago,
	updated_at: (5.days - 6.hours).ago,
	title: "",
	language: "Haskell")

Solution.create(
	text: "Why functional programming?",
	user_id: paavan.id,
	problem_id: ack.id,
	created_at: (5.days - 9.hours).ago,
	updated_at: (5.days - 9.hours).ago,
	title: "",
	language: "Haskell")



fib = Problem.create(title: "Fibonacci Numbers",
	text: "Write a definition for an infinite list of the fibonacci numbers in Haskell",
	expiry: 3.days.ago,
	user_id: aiken.id,
	created_at: 4.days.ago,
	updated_at: 4.days.ago)

Solution.create(
	text: "Why functional programming?
	It's clean and shiny and perfect and round...
	fib = 0:1:zipWith (+) fib (drop 1 fib)",
	user_id: james.id,
	problem_id: fib.id,
	created_at: (4.days - 3.hours).ago,
	updated_at: (4.days - 3.hours).ago,
	title: "",
	language: "Haskell")


Solution.create(
	text: "These questions aren't hard at all.",
	user_id: paavan.id,
	problem_id: fib.id,
	created_at: (4.days - 5.hours).ago,
	updated_at: (4.days - 5.hours).ago,
	title: "",
	language: "Haskell")


