class User < ActiveRecord::Base

	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :errorlogs

  def total_errors
  	self.errorlogs.count
  end

  def unsolved
  	unsolved_errors = []
  	all_errors = self.errorlogs
  	all_errors.each do |error|
  		if error.solutions.count < 1
  			unsolved_errors << error
  		end
  	end	
  	return unsolved_errors.count
  end
end
