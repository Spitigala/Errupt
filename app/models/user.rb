class User < ActiveRecord::Base
  has_many :error_logs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
