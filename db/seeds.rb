# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#EXAM—> SUBJECTS—> TOPICS—> CHAPTERS—> QUESTIONS


exam_one = Exam.create(name: 'Level one')
exam_two = Exam.create(name: 'Level two')

Subject.create(name: 'Programming', exam_id: exam_one.id)
Subject.create(name: 'maths', exam_id: exam_one.id)


Topic.create(name: 'UI', subject_id: Subject.where(name: 'Programming').first.id)
Topic.create(name: 'programs', subject_id: Subject.where(name: 'Programming').first.id)

Topic.create(name: 'theory', subject_id: Subject.where(name: 'maths').first.id)
Topic.create(name: 'sums', subject_id: Subject.where(name: 'maths').first.id)

Chapter.create(name: 'html', topic_id: Topic.where(name: 'UI').first.id)
Chapter.create(name: 'angular', topic_id: Topic.where(name: 'UI').first.id)

Chapter.create(name: 'ruby', topic_id: Topic.where(name: 'programs').first.id)
Chapter.create(name: 'java', topic_id: Topic.where(name: 'programs').first.id)

Question.create(content: 'who invented ruby language', chapter_id: Chapter.where(name: 'ruby').first.id,
				category: 'easy',	options: "{a: 'Yukihiro Matsumoto', b: 'James Gosling', c: 'Dennis Ritchie', d: 'Anders Hejlsberg' }", correct_option: "a")

Question.create(content: 'when was ruby language invented', chapter_id: Chapter.where(name: 'ruby').first.id,
				category: 'medium',	options: "{a: 'mid-1970', b: 'mid-2000', c: 'mid-1980', d: 'mid-1990' }", correct_option: "d")

Question.create(content: 'who invented java language', chapter_id: Chapter.where(name: 'java').first.id,
				category: 'easy',	options: "{a: 'Yukihiro Matsumoto', b: 'James Gosling', c: 'Dennis Ritchie', d: 'Anders Hejlsberg' }", correct_option: "b")

Question.create(content: 'when was first public implementation of Java 1.0 held', chapter_id: Chapter.where(	name: 'java').first.id,	category: 'medium',	options: "{a: '1993', b: '1994', c: '1995', d: '1990' }", correct_option: "c")
