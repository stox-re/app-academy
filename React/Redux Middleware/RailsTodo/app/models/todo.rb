class Todo < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :done, inclusion: { in: [true, false] }

  has_many(:steps, {
    primary_key: :id,
    foreign_key: :todo_id,
    class_name: :Step,
    dependent: :destroy
  })

  belongs_to(:user, {
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  })
end

