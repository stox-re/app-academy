# == Schema Information
#
# Table name: user_comments
#
#  id          :bigint           not null, primary key
#  body        :text             not null
#  author_id   :integer          not null
#  for_user_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class UserComment < ApplicationRecord
  validates :body, presence: true
  validates :for_user_id, presence: true
  validates :author_id, presence: true

  belongs_to(:author, {
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
  })

  belongs_to(:for_user, {
    primary_key: :id,
    foreign_key: :for_user_id,
    class_name: :User
  })
end

