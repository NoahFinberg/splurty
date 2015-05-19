class Quote < ActiveRecord::Base
	#VALIDATION
	#The model (before interacting with the database) checks to see that the input information
	#meets presence and length requirements.
	validates :saying, :presence => true, :length => { :maximum => 140, :minimum => 3 }
	validates :author, :presence => true, :length => { :maximum => 50, :minimum => 3 }
end
