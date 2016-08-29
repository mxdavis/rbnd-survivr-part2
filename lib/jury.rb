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

  def report_votes(final_votes)
    final_votes.each do | finalist, vote |
      puts "#{finalist} has a total of #{vote} vote(s)"
    end
  end

  def announce_winner(final_votes)
    final_votes.each do | finalist, vote |
      if vote >= 4 then
        puts "#{finalist.name.capitalize} won the game!"
        return finalist
      end
    end
  end

end