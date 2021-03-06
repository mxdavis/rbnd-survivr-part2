require_relative "../lib/tribe"
require_relative "../lib/contestant"

class Game
  attr_accessor :tribes

  def initialize(*tribes)
  	@tribes = tribes
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
  	combined_members = @tribes.map(&:members).flatten
  	clear_tribes
    add_tribe(Tribe.new({name: merged_tribes, members: combined_members}))
    return @tribes.first
  end

  def individual_immunity_challenge
  	immunity_challenge.members.sample
  end
end