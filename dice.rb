# /dice.rb

require "sinatra"
require "sinatra/reloader"

require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

# /dice.rb

#main page
get("/") do

  #move into views
  erb(:elephant)
  
  #"
  #<h1>Dice Roll</h1>
	
  #<ul>
  #  <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
  #  <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
  #  <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
  #  <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  #</ul>
  #"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  #first_die = rand(1..6)
  #second_die = rand(1..6)
  #sum = first_die + second_die
	
  #@outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  #@outcome = 
  #"<ul>
  #  <li>
    #{first_die}
  #  </li>
  #  <li>
    #{second_die}
  #  </li>
  #</ul>
  #"

  #simplify using a loop
  #roll 6-sided die 2 times
  @rolls = []

  2.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  #link to template for heading and layout

  #move into views
  #erb(:two_six)

  #move into wrapper
  erb(:two_six) #, { :layout => :wrapper })

  #"<h1>2d6</h1>
  # <p>#{outcome}</p>"

end

get("/dice/2/10") do
  #first_die = rand(1..10)
  #second_die = rand(1..10)
  #sum = first_die + second_die
	
  #@outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  #@outcome = 
  #"<ul>
  #  <li>
    #{first_die}
  #  </li>
  #  <li>
    #{second_die}
  #  </li>
  #</ul>
  #"
	
  #simplify using a loop
  #roll 10-sided die 2 times
  @rolls = []

  2.times do
    die = rand(1..10)

    @rolls.push(die)
  end

  #link to template for heading and layout

  #move into views
  #erb(:two_ten)

  #move into wrapper
  erb(:two_ten) #, { :layout => :wrapper })

  #"<h1>2d10</h1>
  # <p>#{outcome}</p>"
end

get("/dice/1/20") do
  #@first_die = rand(1..20)

  #@outcome = "You rolled a #{@first_die}."
	
  #@outcome = 
  #"<ul>
  #  <li>
    #{@first_die}
  #  </li>
  #</ul>
  #"

  #simplify using a loop
  #roll 20-sided die 1 times
  @rolls = []

  1.times do
    die = rand(1..20)

    @rolls.push(die)
  end

  #link to template for heading and layout

  #move into views
  #erb(:one_twenty)

  #move into wrapper
  erb(:one_twenty) #, { :layout => :wrapper })

  #"<h1>1d20</h1>
  # <p>#{outcome}</p>"
end

get("/dice/5/4") do
  #first_die = rand(1..4)
  #second_die = rand(1..4)
  #third_die = rand(1..4)
  #fourth_die = rand(1..4)
  #fifth_die = rand(1..4)

  #sum = first_die + second_die + third_die + fourth_die + fifth_die
	
  #@outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die}, and a #{fifth_die} for a total of #{sum}."
	
  #simplify using a loop
  #roll 4-sided die 5 times
  @rolls = []

  5.times do
    die = rand(1..4)

    @rolls.push(die)
  end

  #link to template for heading and layout
  erb(:one_hundred_six)

  #@outcome = 
  #"<ul>
  #  <li>
    #{first_die}
  #  </li>
  #  <li>
    #{second_die}
  #  </li>
  #  <li>
    #{third_die}
  #  </li>
  #  <li>
    #{fourth_die}
  #  </li>
  #  <li>
    #{fifth_die}
  #  </li>
  #</ul>
  #"

  #move into views
  #erb(:five_four)
    
  #move into wrapper
  erb(:five_four) #, { :layout => :wrapper })

  #"<h1>5d4</h1>
  # <p>#{outcome}</p>"
end


#roll 100 dice using a loop
get("/dice/100/6") do

  #simplify using a loop
  #roll 6-sided die 100 times
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  #link to template for heading and layout
  erb(:one_hundred_six)
end
