Rails.application.routes.draw do
  resources :questions
  resources :users
  resources :chapters
  resources :topics
  resources :subjects
  resources :exams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
