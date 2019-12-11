class Assessment < ApplicationRecord

	validates :user_id, :question_id, presence: true

	validates :user_option, :inclusion => { :in => ['a', 'b', 'c', 'd']}, if: ->(obj) { obj.user_option.present? }

	validates :user_option,  presence: true, if: ->(obj) { !obj.is_skipped == 'Y'}

	validates :is_skipped, presence: true, if: ->(obj) { !obj.user_option.present? }

	validate :answer_input


	validates :question_id, uniqueness: { scope: :user_id ,  message: "You have already answered for this question." }
	
	belongs_to :user
	belongs_to :question

	def answer_input
		if self.is_skipped == 'Y' && self.user_option.present?  
        	self.errors.add(:answer_input, "Answer must have either user_option or is_skipped in input")
      	end
	end

end
