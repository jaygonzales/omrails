class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

	has_many :tweets
	has_many :ideas
end
