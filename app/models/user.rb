class User < ActiveRecord::Base
	validates :username,
				presence: true,
				uniqueness: true,
				length: {minimum: 4, maximum: 20}

			has_secure_password

	validates :password_confirmation,
				presence: true

	has_many :quizzes
end
