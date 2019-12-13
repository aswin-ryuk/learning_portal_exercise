FactoryGirl.define do
  
  factory :report do
    glucose_level 150
  end

  factory :user do
    name 'test'
    email 'test@gmail.com'
    password 'test123'
    password_confirmation 'test123'
  end

  factory :question do
    content 'who invented ruby language'
    association :chapter, factory: :chapter
	category 'easy'
	options "{a: 'Yukihiro Matsumoto', b: 'James Gosling', c: 'Dennis Ritchie', d: 'Anders Hejlsberg', e: 'skip' }"
	correct_option "a"
  end

  factory :chapter do
    name 'programs'
    association :topic, factory: :topic
  end 

  factory :topic do
    name 'programs'
    association :subject, factory: :subject
  end  

  factory :subject do
    name 'programming'
    association :exam, factory: :exam
  end 

  factory :exam do
    name 'level one'
  end 

end



      