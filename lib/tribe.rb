class Tribe
	attr_accessor :name, :members
 
 

	def initialize(options={})
		@name = options[:name]
		@members = options[:members]
	end

end