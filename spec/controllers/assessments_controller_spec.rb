require 'rails_helper'
RSpec.describe AssessmentsController, type: :controller do
include RequestSpecHelper

	context "Access assessment controller" do
		before(:each) do
			 user =  FactoryGirl.create(:user)
			 authenticated_header(request, user)
			 @question =  FactoryGirl.create(:question)
		end

		describe "GET #choose_question" do             
			it "should render the choose question" do        
				get :choose_question, params:  { assessment: { type: 'chapter' , type_id: @question.chapter.id } }
				expect(response).to have_http_status(200)
				expect(json.first['content']).to eq(@question.content)
			end
		end

		describe "POST #answer" do             
			it "should render the answer" do        
				post :answer, params:  { assessment: { user_option: 'a' , question_id: @question.id } }
				expect(response).to have_http_status(201)
				expect(json['user_option']).to eq('a')
			end
		end

		describe "POST #answer" do             
			it "should render the answer" do        
				get :result, params:  { assessment: { type: 'chapter' , type_id: @question.chapter.id } }
				expect(response).to have_http_status(200)
				expect(json['unseen_questions']).to eq(100)
			end
		end

	
	end

end
