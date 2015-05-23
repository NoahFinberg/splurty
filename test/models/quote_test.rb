require 'test_helper'

class QuoteTest < ActiveSupport::TestCase

	test "unique_quote" do
		quote = Quote.create(:author => 'Noah Finberg', :saying => 'Get out the way.') ## add something to test database
		# puts quote.inspect ##helpful for debugging--outputs the value of the var at given time when run test r

		expected = 'NF#' + quote.id.to_s ##what we want the output to be
		actual = quote.unique_tag ##output of calling the method we are testing
		assert_equal expected, actual ##makes sure what we want is what we get
	end
  

end
