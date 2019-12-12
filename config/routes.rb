Rails.application.routes.draw do

  resources :assessments, only: [:index] do 
  		collection do
			post :answer
			get :choose_question
      get :result
		end
  end 

  post 'user_token' => 'user_token#create'

  resources :questions
  resources :users
  resources :chapters
  resources :topics
  resources :subjects
  resources :exams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
