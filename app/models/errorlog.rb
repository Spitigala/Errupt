class ErrorLog < ActiveRecord::Base
	has_many :solutions
	has_many :tags
	has_many :images
end
