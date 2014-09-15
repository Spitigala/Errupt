class ErrorTag < ActiveRecord::Base
	belongs_to :errorlog
	belongs_to :tag
end
