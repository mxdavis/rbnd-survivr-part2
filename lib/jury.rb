class Jury

  @members = []

  attr_accessor :members, :vote

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
      vote_for = finalists.sample
      votes[vote_for] += 1
    end
    return votes
  end

end