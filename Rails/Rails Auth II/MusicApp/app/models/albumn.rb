# == Schema Information
#
# Table name: albumns
#
#  id         :bigint           not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :date             not null
#  is_live    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Albumn < ApplicationRecord
  validates :title, presence: true
  validates :year, presence: true
  validates :band_id, presence: true
  validates :year, presence: true

  belongs_to(:band, {
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band
  })
end
