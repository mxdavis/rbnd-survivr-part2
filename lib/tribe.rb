class Tribe
  attr_accessor :name, :members

  def initialize(options={})
	@name = options[:name]
	@members = options[:members]
  puts @name
  end

  def to_s
    @name
  end

  def tribal_council(options={})
    members_left = @members.select { |member| member != options[:immune] }
    member_who_was_voted_off = members_left.sample
    @members.delete(member_who_was_voted_off)
    return member_who_was_voted_off
  end
 end