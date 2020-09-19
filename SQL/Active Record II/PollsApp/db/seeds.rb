# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  AnswerChoice.destroy_all
  Response.destroy_all

  u1 = User.create!(username: 'Jon')
  u2 = User.create!(username: 'Matthew')
  u3 = User.create!(username: 'Curtis')
  u4 = User.create!(username: 'Jennifer')

  p1 = Poll.create!(title: 'Dog Poll', author: u1)
  p2 = Poll.create!(title: 'Cat Poll', author: u2)

  q1 = Question.create!(text: 'Which dog breed is the cutest?', poll: p1)
  answer1 = AnswerChoice.create!(text: 'Portuguese Water Dog', question: q1)
  answer2 = AnswerChoice.create!(text: 'Golden Doodle', question: q1)
  answer3 = AnswerChoice.create!(text: 'Border Doodle', question: q1)

  q2 = Question.create!(text: 'Which dog toy is best?', poll: p1)
  answer4 = AnswerChoice.create!(text: 'Dog Bone', question: q2)
  answer5 = AnswerChoice.create!(text: 'Chewy toy', question: q2)

  q3 = Question.create!(text: 'Which dog food is best?', poll: p1)
  answer6 = AnswerChoice.create!(text: 'Kibbles', question: q3)
  answer7 = AnswerChoice.create!(text: 'Meat', question: q3)

  q4 = Question.create!(text: 'What cat breed is the cutest?', poll: p2)
  answer8 = AnswerChoice.create!(text: 'Domestic Long Hair', question: q4)
  answer9 = AnswerChoice.create!(text: 'Siamese', question: q4)
  answer10 = AnswerChoice.create!(text: 'Tabby', question: q4)

  q5 = Question.create!(text: 'Which cat toy is the best?', poll: p2)
  answer11 = AnswerChoice.create!(text: 'Ball', question: q5)
  answer12 = AnswerChoice.create!(text: 'Feather', question: q5)

  r1 = Response.create!(
    respondent: u2,
    answer_choice: answer1
  )

  r2 = Response.create!(
    respondent: u2,
    answer_choice: answer4
  )

  r3 = Response.create!(
    respondent: u2,
    answer_choice: answer6
  )

  r4 = Response.create!(
    respondent: u3,
    answer_choice: answer2
  )

  r5 = Response.create!(
    respondent: u3,
    answer_choice: answer4
  )

  r6 = Response.create!(
    respondent: u3,
    answer_choice: answer6
  )

  r7 = Response.create!(
    respondent: u4,
    answer_choice: answer3
  )

  r8 = Response.create!(
    respondent: u4,
    answer_choice: answer5
  )

  r9 = Response.create!(
    respondent: u4,
    answer_choice: answer7
  )

  rc1 = Response.create!(
    respondent: u1,
    answer_choice: answer10
  )

  rc2 = Response.create!(
    respondent: u1,
    answer_choice: answer12
  )

  rc3 = Response.create!(
    respondent: u3,
    answer_choice: answer10
  )

  rc4 = Response.create!(
    respondent: u3,
    answer_choice: answer12
  )

  rc5 = Response.create!(
    respondent: u4,
    answer_choice: answer8
  )

  rc6 = Response.create!(
    respondent: u4,
    answer_choice: answer11
  )
end