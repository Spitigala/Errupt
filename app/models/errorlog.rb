class Errorlog < ActiveRecord::Base
	belongs_to :user
	has_many :solutions
	has_many :error_tags
	has_many :tags, through: :error_tags
	has_attached_file :image, :styles => { :medium => "600x400>"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :title, presence: true
	validates :description, presence: true
  validates_inclusion_of :public, in: [true, false]

	def self.tagged_with(tag_name)
    Tag.find_by_tag_tag_name!(tag_name).errorlogs
  end
  
  def tag_list
    tags.map(&:tag_name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(tag_name: n.strip).first_or_create!
    end
  end
end
