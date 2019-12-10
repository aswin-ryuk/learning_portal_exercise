class Exam < ApplicationRecord

	validates :name,  presence: true, uniqueness: { case_sensitive: false }

	has_many :subjects

end
