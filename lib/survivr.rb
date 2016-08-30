require 'colorize'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  puts "Phase One".colorize(:red).on_blue
  8.times do
  	the_loosing_team = @borneo.immunity_challenge
  	loser = the_loosing_team.tribal_council
  	puts "#{the_loosing_team} has lost their teammate #{loser}".red
  	the_loosing_team.members.delete(loser)
  end
end

def phase_two
  puts "Phase Two".colorize(:red).on_blue
  3.times do
    immune = @borneo.individual_immunity_challenge
    puts "#{immune} is safe".green
	another_loser = @merge_tribe.tribal_council
	@merge_tribe.members.delete(another_loser)		
	puts "#{another_loser}, you are out of the game.".magenta	 	
  end
end

def phase_three
  puts "Phase Three".colorize(:red).on_blue
  7.times do
  	contestant_to_jury = @merge_tribe.tribal_council
  	puts "#{contestant_to_jury} is now on the jury team".yellow
    @jury.add_member(contestant_to_jury)
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
puts "Here are the votes:".light_blue
vote_results = @jury.cast_votes(finalists) #Jury members report votes
puts "Here come the votes....".blue.on_red.blink
@jury.report_votes(vote_results) #Jury announces their votes
puts "And the final winner is.....".blue.on_red.blink
@jury.announce_winner(vote_results) #Jury announces final winner
