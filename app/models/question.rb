class Question < ApplicationRecord

	validates :content, :category, :options, :chapter_id, :correct_option, presence: true
	
	validates :category, :inclusion => { :in => ['easy', 'medium', 'hard']}

	belongs_to :chapter

end