# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#
class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author_id, presence: true

  belongs_to(:author, {
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
  })

  has_many(:post_subs, {
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :PostSub
  })

  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )

  has_many(:comments, {
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Comment
  })
end
