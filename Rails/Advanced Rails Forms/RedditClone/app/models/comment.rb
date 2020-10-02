# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  post_id    :integer          not null
#  author_id  :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  validates :author_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true

  belongs_to(:author, {
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
  })

  has_many(:post, {
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Post
  })
end
