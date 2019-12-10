class Topic < ApplicationRecord

	validates :name, :subject_id, presence: true
	
	validates :name, uniqueness: { case_sensitive: false }

	has_many :chapters
	belongs_to :subject

end
