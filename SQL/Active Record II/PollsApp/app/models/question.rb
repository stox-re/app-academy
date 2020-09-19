# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  validates :text, presence: true, uniqueness: true

  belongs_to(:poll, {
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll
  })

  has_many(:answer_choices, {
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice
  })

  has_many(:responses,
    through: :answer_choices,
    source: :responses
  )

  def results
    results = {}

    data = answer_choices.find_by_sql([
      'SELECT answer_choices.id, answer_choices.text, COUNT(answer_choice_id) AS response_count
      FROM answer_choices
      LEFT JOIN responses ON responses.answer_choice_id = answer_choices.id
      WHERE question_id = ?
      GROUP BY answer_choices.id',
      self.id])

    data.each do |choice|
      results[choice.text] = choice.response_count
    end

    results
  end
end
