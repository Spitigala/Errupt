class User < ActiveRecord::Base
  has_many :errorlogs
  
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def total_errors
  	self.errorlogs.count
  end

end
