class Track < ApplicationRecord
  validates :title, presence: true
  validates :ord, presence: true

  belongs_to(:albumn, {
    primary_key: :id,
    foreign_key: :albumn_id,
    class_name: :Albumn
  })
end