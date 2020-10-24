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
end

