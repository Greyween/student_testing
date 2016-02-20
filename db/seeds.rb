# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_test = Test.create!(name: 'Ruby on Rails CW#1', description: 'Ruby basics')

first_question = Question.create!(content: 'Which console commands are used to traverse directories in UNIX?',
                                  test: first_test)
second_question = Question.create!(content: 'How to run program.rb from command line?',
                                   test: first_test)
third_question = Question.create!(content: 'What is the name of "+" operation in Ruby?',
                                  test: first_test)
fourth_question = Question.create!(content: 'What of these is true for variables?',
                                   test: first_test)

first_answer = Answer.create!(content: 'cd, ls', correct: true, question: first_question)
second_answer = Answer.create!(content: 'cp, mkdir', question: first_question)
third_anwser = Answer.create!(content: 'mv, rm', question: first_question)
fourth_answer = Answer.create!(content: 'rmdir, exit', question: first_question)