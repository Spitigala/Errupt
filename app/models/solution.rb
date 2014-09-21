class Solution < ActiveRecord::Base
	belongs_to :errorlog

	validates :description, presence: true
	validates :worked, presence: true
end
