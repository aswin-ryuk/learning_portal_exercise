class AssessmentsController < ApplicationController

  # GET /assessments
  def index
    @assessments = Assessment.all

    render json: @assessments
  end


  # POST /assessments/
  def answer
    @assessment = Assessment.new(assessment_params)
    @assessment.user_id = current_user.id
    if @assessment.save
      @assessment.update_attribute(:is_correct, check_user_answer) if @assessment.user_option.present?
      render json: @assessment, status: :created
    else
      render json: @assessment.errors, status: :unprocessable_entity
    end
  end


  private

    # Only allow a trusted parameter "white list" through.
    def assessment_params
      params.require(:assessment).permit(:question_id, :user_option, :is_skipped)
    end

    def check_user_answer
      @assessment.question.correct_option.downcase == @assessment.user_option.downcase ? "Y" : "N"
    end
end
