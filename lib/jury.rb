class Jury

  @members = []

  attr_reader :members

  def initialize
    @members = []
  end

  def add_member(member)
  	@members.unshift(member)
  end

  def cast_votes(vote)
    @votes = {}
  end

end