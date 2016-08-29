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

  def merge(merged_tribes)
  	combined_members = @tribes[0].members + @tribes[1].members
  	clear_tribes
    combined_tribe = Tribe.new({name: merged_tribes, members: combined_members})
  end

  def individual_immunity_challenge
  	immunity_challenge.members.sample
  end
end