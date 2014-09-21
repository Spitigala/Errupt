class Errorlog < ActiveRecord::Base
	belongs_to :user
	has_many :solutions
	has_many :error_tags
	has_many :tags, through: :error_tags
	has_many :images

	validates :title, presence: true
	validates :description, presence: true
end
