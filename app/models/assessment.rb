class Assessment < ApplicationRecord

	validates :user_id, :question_id, :user_option, presence: true

	validates :user_option, :inclusion => { :in => ['a', 'b', 'c', 'd', 'e']}

	validates :question_id, uniqueness: { scope: :user_id ,  message: "You have already answered for this question." }
	
	belongs_to :user
	belongs_to :question

	def self.fetch_assessment_questions(all_questions_ids, current_user_id)
		Assessment.where(question_id: all_questions_ids, user_id: current_user_id)
	end

end
