class Question < ApplicationRecord

	validates :name, :content, :category, :options, :chapter_id, :correct_option, presence: true
	
	validates :name, uniqueness: { case_sensitive: false }

	validates :category, :inclusion => { :in => ['easy', 'medium', 'hard']}

	belongs_to :chapter_id

end