# == Schema Information
#
# Table name: goal_comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  goal_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GoalComment < ApplicationRecord
  validates :body, presence: true
  validates :author_id, presence: true
  validates :goal_id, presence: true

  belongs_to(:author, {
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
  })

  belongs_to(:goal, {
    primary_key: :id,
    foreign_key: :goal_id,
    class_name: :Goal
  })
end
