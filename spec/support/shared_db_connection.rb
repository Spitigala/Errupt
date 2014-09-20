class ActiveRecord::Base 
	mattr_accessor :shared_connection 
	@@shared_connection = nil

	def self.connection
		@@shared_connection || retrieve_connection
	end
end
ActiveRecord::Base.shared_connection=ActiveRecord::Base.connection

=begin

"We need to share data state across the Selenium web server and the test code itself. 
Without DatabaseCleaner and the above patch, we’re apt to get sporadic error messages 
resulting from tests not properly cleaning up after themselves."

source: everyday rails: testing with rspec, p.86

=end