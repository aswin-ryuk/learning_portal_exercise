class Chapter < ApplicationRecord

	validates :name, :topic_id, presence: true
	
	validates :name, uniqueness: { case_sensitive: false }

	has_many :questions
	belongs_to :topic_id

end
