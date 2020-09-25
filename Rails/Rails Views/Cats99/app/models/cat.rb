# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  def self.colours
    %w(black white grey red)
  end

  def age
    time_ago_in_words(self.birth_date.to_datetime)
  end

  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: { in: self.colours, message: "%{value} is not a valid color" }
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F), message: "%{value} is not a valid sex" }
  validates :description, presence: true

  has_many(:cat_rental_requests, {
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest
  })
end
