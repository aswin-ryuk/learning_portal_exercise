# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.where([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.where(name: 'Luke', movie: movies.first)

#EXAM—> SUBJECTS—> TOPICS—> CHAPTERS—> QUESTIONS


exam_one = Exam.where(name: 'Level one').first_or_create
exam_two = Exam.where(name: 'Level two').first_or_create

Subject.where(name: 'Programming', exam_id: exam_one.id).first_or_create
Subject.where(name: 'maths', exam_id: exam_one.id).first_or_create


Topic.where(name: 'UI', subject_id: Subject.where(name: 'Programming').first.id).first_or_create
Topic.where(name: 'programs', subject_id: Subject.where(name: 'Programming').first.id).first_or_create

Topic.where(name: 'theory', subject_id: Subject.where(name: 'maths').first.id).first_or_create
Topic.where(name: 'sums', subject_id: Subject.where(name: 'maths').first.id).first_or_create

Chapter.where(name: 'html', topic_id: Topic.where(name: 'UI').first.id).first_or_create
Chapter.where(name: 'angular', topic_id: Topic.where(name: 'UI').first.id).first_or_create

Chapter.where(name: 'ruby', topic_id: Topic.where(name: 'programs').first.id).first_or_create
Chapter.where(name: 'java', topic_id: Topic.where(name: 'programs').first.id).first_or_create

Question.where(content: 'who invented ruby language', chapter_id: Chapter.where(name: 'ruby').first.id,
				category: 'easy',	options: "{a: 'Yukihiro Matsumoto', b: 'James Gosling', c: 'Dennis Ritchie', d: 'Anders Hejlsberg', e: 'skip' }", correct_option: "a").first_or_create

Question.where(content: 'when was ruby language invented', chapter_id: Chapter.where(name: 'ruby').first.id,
				category: 'medium',	options: "{a: 'mid-1970', b: 'mid-2000', c: 'mid-1980', d: 'mid-1990', e: 'skip'}", correct_option: "d").first_or_create

Question.where(content: 'when was ruby language invented', chapter_id: Chapter.where(name: 'ruby').first.id,
				category: 'medium',	options: "{a: 'mid-1970', b: 'mid-2000', c: 'mid-1980', d: 'mid-1990', e: 'skip'}", correct_option: "d").first_or_create

Question.where(content: 'Ruby language was influenced by', chapter_id: Chapter.where(name: 'ruby').first.id,
				category: 'medium',	options: "{a: 'C', b: 'Python', c: 'Perl', d: 'Java', e: 'skip'}", correct_option: "c").first_or_create

Question.where(content: 'who invented java language', chapter_id: Chapter.where(name: 'java').first.id,
				category: 'easy',	options: "{a: 'Yukihiro Matsumoto', b: 'James Gosling', c: 'Dennis Ritchie', d: 'Anders Hejlsberg', e: 'skip' }", correct_option: "b").first_or_create

Question.where(content: 'when was first public implementation of Java 1.0 held', chapter_id: Chapter.where(	name: 'java').first.id,	category: 'medium',	options: "{a: '1993', b: '1994', c: '1995', d: '1990',e: 'skip' }", correct_option: "c").first_or_create

User.create(name: 'admin', email: 'admin@gmail.com', password: 'admin123', password_confirmation: 'admin123')

