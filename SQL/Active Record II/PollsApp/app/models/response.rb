# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :integer          not null
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
  validate :respondent_already_answered?
  validate :author_cant_answer_own_poll

  belongs_to(:answer_choice, {
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice
  })

  belongs_to(:respondent, {
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  })

  has_one(:question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    self.question.responses.where.not({ :id => self.id })
  end

  def respondent_already_answered?
    if self.sibling_responses.any? { |response| response.user_id == self.user_id }
      errors[:respondent] << "already answered this question"
    end
  end

  def author_cant_answer_own_poll
    if self.user_id = self.question.poll.author_id
      errors[:respondent] << "created this poll, so you can not answer a question in it"
    end
  end
end
