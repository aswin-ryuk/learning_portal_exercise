require 'test_helper'

class AssessmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment = assessments(:one)
  end

  test "should get index" do
    get assessments_url, as: :json
    assert_response :success
  end

  test "should create assessment" do
    assert_difference('Assessment.count') do
      post assessments_url, params: { assessment: { is_correct: @assessment.is_correct, is_skipped: @assessment.is_skipped, question_id: @assessment.question_id, user_id: @assessment.user_id, user_option: @assessment.user_option } }, as: :json
    end

    assert_response 201
  end

  test "should show assessment" do
    get assessment_url(@assessment), as: :json
    assert_response :success
  end

  test "should update assessment" do
    patch assessment_url(@assessment), params: { assessment: { is_correct: @assessment.is_correct, is_skipped: @assessment.is_skipped, question_id: @assessment.question_id, user_id: @assessment.user_id, user_option: @assessment.user_option } }, as: :json
    assert_response 200
  end

  test "should destroy assessment" do
    assert_difference('Assessment.count', -1) do
      delete assessment_url(@assessment), as: :json
    end

    assert_response 204
  end
end
