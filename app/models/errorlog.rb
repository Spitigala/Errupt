class Errorlog < ActiveRecord::Base
	belongs_to :user
	has_many :solutions
	has_many :error_tags
	has_many :tags, through: :error_tags
	has_attached_file :image, :styles => { :medium => "600x400>"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :title, presence: true
	validates :description, presence: true
end
