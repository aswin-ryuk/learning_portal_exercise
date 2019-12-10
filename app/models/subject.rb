class Subject < ApplicationRecord

	validates :name, :exam_id, presence: true
	
	validates :name, uniqueness: { case_sensitive: false }

	has_many :topics
	belongs_to :exam

end
