# == Schema Information
#
# Table name: goals
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  is_public   :boolean          default(FALSE), not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Goal < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  has_many(:comments, {
    primary_key: :id,
    foreign_key: :goal_id,
    class_name: :GoalComment,
    dependent: :destroy
  })

  def set_public
    self.is_public = true
    self.save!
  end

  def set_private
    self.is_public = false
    self.save!
  end
end

