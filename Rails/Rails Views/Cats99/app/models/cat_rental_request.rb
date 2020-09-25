# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
  include ActionView::Helpers::DateHelper

  def self.statuses
    %w(PENDING APPROVED DENIED)
  end

  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: self.statuses, message: "%{value} is not a valid status" }

  belongs_to(:cat, {
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat
  })
end
