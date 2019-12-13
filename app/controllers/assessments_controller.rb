class AssessmentsController < ApplicationController

  before_action :authenticate_user
  
  # GET /assessments
  def index
    @assessments = Assessment.all
    render json: @assessments
  end


  # POST /assessments/answer
  #To answer any particular question
  def answer
    @assessment = Assessment.new(assessment_params)
    @assessment.user_id = current_user.id
    if @assessment.save
      @assessment.update_attributes(check_user_answer)
      render json: @assessment.as_json(only: [:question_id, :user_option, :is_correct,:is_skipped]), status: :created
    else
      render json: @assessment.errors, status: :unprocessable_entity
    end
  end

  # GET /assessments/choose_question
  #To choose random question from the selected category type
  def choose_question
    if params.dig(:assessment, :type).present? && params.dig(:assessment, :type_id).present?
      type = params[:assessment][:type].camelize.constantize.where(id: params[:assessment][:type_id]).first rescue ''
      if type.present?
        all_questions = fetch_all_questions(type)
        if all_questions.count > 0
          assessment_questions = Assessment.fetch_assessment_questions(all_questions.ids, current_user.id)
          render json: calculate_remaining_qusts(all_questions, assessment_questions).order("RANDOM()").limit(2).select(:id, :content, :options)
        else
          render json: {'type': 'No data found for selected type'}
        end
      else
        render json: {'type': 'Invalid selected type or type id'}
      end
    else
      render json: {'Input': 'Invalid inputs'}
    end
  end

 # GET /assessments/result
 # To fectch the assessment details of particular user base on category type
  def result
    if params.dig(:assessment, :type).present? && params.dig(:assessment, :type_id).present?
      type = params[:assessment][:type].camelize.constantize.where(id: params[:assessment][:type_id]).first rescue ''
      if type.present?
        all_questions = fetch_all_questions(type)
        total_qusts_count = all_questions.count 
        if total_qusts_count > 0
          assessment_questions = Assessment.fetch_assessment_questions(all_questions.ids, current_user.id)
          result = {
            correct_answers: ((assessment_questions.where(is_correct: 'Y').count*100)/total_qusts_count),
            wrong_answers: ((assessment_questions.where(is_correct: 'N').count*100)/total_qusts_count),
            skipped_questions: ((assessment_questions.where(is_skipped: 'Y').count*100)/total_qusts_count) , 
            unseen_questions: ((total_qusts_count-assessment_questions.count)*100)/total_qusts_count
          }
          render json: result
        else
          render json: {'type': 'No data found for selected type'}
        end
      else
        render json: {'type': 'Invalid selection of type or type id'}
      end
    else
      render json: {'Input': 'Invalid inputs'}
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def assessment_params
      params.require(:assessment).permit(:question_id, :user_option)
    end

    def choose_question_params
      params.require(:assessment).permit(:type_id, :type)
    end

    def check_user_answer
      if @assessment.user_option.downcase != 'e'
        answer =  (@assessment.question.correct_option.downcase == @assessment.user_option.downcase ? "Y" : "N")
        {is_correct: answer}
      else
        {is_skipped: 'Y'}
      end
    end

    #EXAM—> SUBJECTS—> TOPICS—> CHAPTERS—> QUESTIONS
    def fetch_all_questions(type)
      case type.class.to_s
      when "Exam"
        Question.joins(chapter: {topic:  {subject: :exam}}).where('exams.id = ?', type.id)
      when "Subject"
        Question.joins(chapter: {topic:  :subject}).where('subjects.id = ?', type.id)
      when "Topic"
        Question.joins(chapter: :topic).where('topics.id = ?', type.id)
      when "Chapter"
        Question.joins(:chapter).where('chapters.id = ?', type.id)
      else
        {'input': 'Invalid input type'}
      end
    end

    def calculate_remaining_qusts(all_questions, assessment_questions)
      remaining_qusts = Question.where(id: (all_questions.ids - assessment_questions.pluck(:question_id)))
      if remaining_qusts.count > 0
        remaining_qusts
      else
        skipped_qusts =  assessment_questions.where(is_skipped: 'Y')
        ((skipped_qusts.count == 0) ? {'questions': 'Completed all question in the selected type'} : Question.where(id: skipped_qusts.pluck(:question_id)))
      end
    end

end
