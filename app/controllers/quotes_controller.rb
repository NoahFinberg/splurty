class QuotesController < ApplicationController

	#stores the business logic for the root page
	def index
		#pull a random quote from the database and save it in the instance variable @quote
		@quote = Quote.order("RANDOM()").first
	end

	#creates a new instance of the quote class and saves it to the database if it meets validation requirements
	def create
		#create the quote with user imputted parameters and save that quote in the instance varaible @quote
		@quote = Quote.create(quote_params)
		#check if the quote meets validation requirements
		if @quote.invalid?
			#if it doesn't, alert the user that saving failed
			flash[:error] = '<strong>Could not save:</strong> the data you entered is invalid'
		end
		#regardless of success or failure redirect the user to the homepage
		redirect_to root_path
	end

	#creates the action necessary for the about page. There is no business logic because it is a static page.
	def about
	end

	private

	#strong parameters
	#returns what the user enetered into the create form
	def quote_params
		#allows secure access to the quote's params hash--specifically the :saying and :author attributes
		params.require(:quote).permit(:saying, :author)
	end
end
