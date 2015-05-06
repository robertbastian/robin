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
	text: "<p>The <em>Ackermann</em> function is defined as:</p><ul><li><p><code>ack(0,y) = y+1</code></p></li><li><p><code>ack(x+1,0) = ack(x,1)</code></p></li><li><p><code>ack (x+1,y+1) = ack(x, ack(x+1, y))</code></p></li></ul><p>Define <code>f</code> such that <code>ack_c = foldn (succ, f)</code> is a curried version of the <em>Ackermann</em> function, i.e. <code>ack(x,y) = ack_c x y</code>. Here, <code>succ</code> is the natural number successor function, and <code>foldn (e, g) n</code> applies <code>g</code> to <code>e</code> n times.</p>",
	expiry: 4.days.ago,
	user_id: james.id,
	winner_id: aiken.id,
	score: 50
	created_at: 5.days.ago,
	updated_at: 5.days.ago)


Solution.create(
	text: "f g = foldn (g 1, g)
	-- ack_c x gives a function from Nat -> Nat.
	-- ack_c 0 gives succ,
	-- ack_c 1 gives f succ,
	-- and so on.
	-- This can be explained by noticing that
	-- the partially applied function
	-- ack(x+1, _) is a function defined in terms of ack(x, _).
	-- if we expand the definitions we see that ack(x+1, y) =
	-- ack(x, ack(x+1, y-1)) = ack(x, ack(x, ack(x+1, y-2))) = ... =
	-- ack(x, _)^y(ack(x+1, y-y)) = ack(x, _)^y(ack(x,1))
	-- this is precisely foldn (ack(x,1), ack(x, _)) y.
",
	user_id: aiken.id,
	problem_id: ack.id,
	created_at: (5.days - 4.hours).ago,
	updated_at: (5.days - 4.hours).ago,
	score: 70
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
	winner_id: rob.id,
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


Solution.create(
	text: "These questions aren't hard at all.",
	user_id: paavan.id,
	problem_id: fib.id,
	created_at: (4.days - 5.hours).ago,
	updated_at: (4.days - 5.hours).ago,
	title: "",
	language: "Haskell")

Solution.create(
	text: "I think I should be the winner.",
	user_id: rob.id,
	problem_id: fib.id,
	created_at: (4.days - 7.hours).ago,
	updated_at: (4.days - 7.hours).ago,
	title: "",
	language: "Haskell")


ack2 = Problem.create(title: "Sliding Window Protocol",
	text: "Write CSO functions <code>[T]Send(n: Int, out: ![T], get_ack: ?[Int]): Proc</code> 
	and <code>[T]Recv(n: Int, in: ?[T], ack: ![Int]): Proc </code>
	that correctly send frames T over a lossy network modelled by lossy, using
	the sliding window protocol with windows of size n. Note if n = 1 this is the alternating bit protocol.
	<code>
	def lossy(in: OneOne[T], out: OneOne[T], get_ack: OneOne[Int], ack: OneOne[Int]): Proc = {
		val r = new scala.util.random
		serve (
			out =?=> {x:T => if (r.nextInt(2) == 0) in!x}
			ack =?=> {x:Int => if (r.nextInt(2) == 0) get_ack!x}
		)

	}
	val in, out = OneOne[T]
	val get_ack, ack = OneOne[Int]
	</code>
	",
	expiry: 2.days.ago,
	user_id: rob.id,
	created_at: 3.days.ago,
	updated_at: 3.days.ago)

