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
    vulnerable_members = @members.select { |member| member != options[:immune] }
    voted_off_member = vulnerable_members.sample
    @members.delete(voted_off_member)
    return voted_off_member
  end
 end