class Jury

  @members = []

  attr_accessor :members

  def initialize
    @members = []
    
  end

  def add_member(member)
  	@members << member
  end

  def cast_votes(finalists)
    votes = {}
    finalists.each { |finalist| votes[finalist] = 0 }
    @members.each do |member|
      vote = finalists.sample
      puts "#{member} votes for #{vote}!" 
      votes[vote] += 1
    end
    return votes
  end

end