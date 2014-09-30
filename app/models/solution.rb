class Solution < ActiveRecord::Base
	belongs_to :errorlog
	
	validates :description, presence: true
	validates_inclusion_of :worked, in: [true, false]
end
