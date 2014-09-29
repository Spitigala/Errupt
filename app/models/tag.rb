class Tag < ActiveRecord::Base
	has_many :error_tags
	has_many :errorlogs, through: :error_tags
	validates :tag_name, presence: true
end