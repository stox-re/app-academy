# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  user_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  validates :artwork_id, presence: true
  validates :user_id, presence: true
  validates :body, presence: true

  belongs_to(:author, {
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  })

  belongs_to(:artwork, {
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork
  })
end
