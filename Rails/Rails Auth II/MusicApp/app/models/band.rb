# == Schema Information
#
# Table name: bands
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Band < ApplicationRecord
  validates :name, presence: true

  has_many(:albumns, {
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Albumn,
    dependent: :destroy
  })

  has_many(:tracks, {
    primary_key: :id,
    through: :albumns,
    dependent: :destroy
  })
end
