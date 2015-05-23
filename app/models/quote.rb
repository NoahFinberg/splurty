class Quote < ActiveRecord::Base
	#VALIDATION
	#The model (before interacting with the database) checks to see that the input information
	#meets presence and length requirements.
	validates :saying, :presence => true, :length => { :maximum => 140, :minimum => 3 }
	validates :author, :presence => true, :length => { :maximum => 50, :minimum => 3 }


	##converts a name and quote id into the desired format. (Ex: author: Noah Finberg quote_id: 1 => 'NF#1')
	def unique_tag

		##collect transforms given array into the new array abbr
		abbr = self.author.split(" ").collect do |sub_string|
			sub_string[0] #puts first letter of each substring into intials array
		end

		return abbr.join + '#' + self.id.to_s ##join concatenates an array into a string
	end
end
