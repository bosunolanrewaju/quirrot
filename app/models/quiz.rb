class Quiz < ActiveRecord::Base
	belongs_to :user
	has_many :questions
	has_many :temp_questions

	validates :title,
				presence: true
end
