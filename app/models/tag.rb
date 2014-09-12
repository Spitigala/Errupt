class Tag < ActiveRecord::Base
	belongs_to :errorlog
	validates :tag_name, presence: true
end
