class Tag < ActiveRecord::Base
	has_many :error_tags
	has_many :errorlogs, through: :error_tags
	validates :tag_name, presence: true

	def self.by_tag(tag)
		where("tag_name LIKE ?", "#{tag}") #search by tag
	end

end