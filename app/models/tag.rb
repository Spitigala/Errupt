class Tag < ActiveRecord::Base
	belongs_to :errorlog
	validates :tag_name, presence: true

	def self.by_tag(tag)
		where("tag_name LIKE ?", "#{tag}").first #search by tag
	end

end
