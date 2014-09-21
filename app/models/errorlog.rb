class Errorlog < ActiveRecord::Base
	belongs_to :user
	has_many :solutions
	has_many :error_tags
	has_many :tags, through: :error_tags
	has_attached_file :image, :styles => { :medium => "600x400>"}

	validates :title, presence: true
	validates :description, presence: true
end
