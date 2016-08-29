require_relative "../lib/tribe"
require_relative "../lib/contestant"

class Game
  attr_accessor :tribes

  def initialize(tribe1, tribe2)
  	@tribes = [tribe1, tribe2]
  end

  def add_tribe(tribe)
  	@tribes << tribe
  end

  def immunity_challenge
  	@tribes.sample
  end 

  def clear_tribes
  	@tribes.clear
  end
end